import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/null_Button.dart';

class codeFill extends StatelessWidget {
  final title;
  final bool reset;


  const codeFill({Key? key, required this.title,required this.reset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              leading: myApplication.backIcon(context, () {
            SignUpCubit.code = "";
            SignUpCubit.email = "";
          })),
          body: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  SizedBox(
                    height: myApplication.hightClc(140, context),
                  ),
                  Center(
                      child: Text(
                    "Code Has Been Sent To " +
                        SignUpCubit.email.substring(0, 7) +
                        "****" +
                        SignUpCubit.email.substring(11, 13),
                    style: TextStyle(fontSize: 14),
                  )),
                  SizedBox(
                    height: myApplication.hightClc(50, context),
                  ),
                  Center(
                    child: VerificationCode(
                        underlineColor: myColors.blu,
                        textStyle: Theme.of(context).textTheme.bodyLarge!,
                        underlineUnfocusedColor: Colors.transparent,
                        fillColor: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        itemSize: 70,
                        fullBorder: true,
                        onCompleted: (c) {
                          SignUpCubit.code = c;
                        },
                        onEditing: (code) {}),
                  ),
                  SizedBox(
                    height: myApplication.hightClc(45, context),
                  ),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return SignUpCubit.cansend
                          ? Center(
                              child: InkWell(
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Text(
                                      "send",
                                      style: TextStyle(
                                          color: myColors.blu, fontSize: 18),
                                    )),
                                onTap: () =>
                                    BlocProvider.of<SignUpCubit>(context)
                                        .blockSend(),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("resend code in",
                                    style: TextStyle(fontSize: 14)),
                                Flexible(
                                  child: SlideCountdown(
                                    onDone: () =>
                                        BlocProvider.of<SignUpCubit>(context)
                                            .allowSend(),
                                    textStyle: TextStyle(
                                        fontSize: 14, color: myColors.blu),
                                    duration: const Duration(seconds: 10),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Text("second", style: TextStyle(fontSize: 14)),
                              ],
                            );
                    },
                  ),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return Expanded(
                        child: Column(
                          children: [
                            Spacer(),
                            BlocBuilder<SignUpCubit, SignUpState>(
                                    builder: (context, state) {
                                      if (state is SignUpCodeFillLoading) {
                                        return Container(
                                          height: 48,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      } else {
                                        return confirmButton(
                                            ontap: () async {
                                              BlocProvider.of<SignUpCubit>(
                                                      context)
                                                  .verifyCode(context,reset);
                                            },
                                            text: "Verify");
                                      }
                                    },
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: myApplication.hightClc(68, context),
                  ),
                ],
              ))),
    );
  }
}
