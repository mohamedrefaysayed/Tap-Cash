// ignore_for_file: camel_case_types, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/password_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class codeFill extends StatelessWidget {

  //reset to check this is reset pass or signUp flow
  final bool reset;

  const codeFill({Key? key, required this.reset}) : super(key: key);

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
              margin:  EdgeInsets.all(myApplication.widthClc(20, context)),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "please check your Gmail,\n enter your verification number",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.w700),
                  ),

                  SizedBox(
                    height: myApplication.hightClc(140, context),
                  ),

                  Center(
                      child: Text(
                    "Code Has Been Sent To ${SignUpCubit.email.substring(0, 7)}****${SignUpCubit.email.substring(11, 13)}",
                    style: const TextStyle(fontSize: 14),
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
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        itemSize: myApplication.widthClc(70, context),
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

                                child:  SizedBox(

                                    height: myApplication.hightClc(50, context),
                                    width: myApplication.widthClc(70, context),

                                    child: Text(
                                      "resend",
                                      style: TextStyle(
                                          color: myColors.blu, fontSize: myApplication.widthClc(18, context)),
                                    )
                                ),

                                onTap: () {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .resendCode(context);
                                  BlocProvider.of<SignUpCubit>(context)
                                      .blockSend();
                                }
                                    
                              ),
                            )

                          : Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                 Text("resend code in",
                                    style: TextStyle(fontSize: myApplication.widthClc(14, context))),

                                Flexible(

                                  child: SlideCountdown(

                                    onDone: () =>
                                        BlocProvider.of<SignUpCubit>(context)
                                            .allowSend(),

                                    textStyle:  TextStyle(
                                        fontSize: myApplication.widthClc(14, context), color: myColors.blu),

                                    duration: const Duration(seconds: 60),
                                    decoration: const BoxDecoration(),
                                  ),
                                ),

                                 Text("second",
                                    style: TextStyle(fontSize: myApplication.widthClc(14, context))),

                              ],
                            );
                    },
                  ),

                  Expanded(

                    child: Column(
                      children: [

                        const Spacer(),

                        BlocConsumer<SignUpCubit, SignUpState>(
                          listener: (context, state) {

                            if (state is SignUpCodeFillSuccess) {
                                showTopSnackBar(Overlay.of(context),
                                    mySnackBar.success(message: state.successmessage));

                                  myApplication.navigateTo(passwordFill(
                                    title: reset
                                        ? Text(
                                      "Create New  Password",
                                      style: TextStyle(
                                          fontSize: myApplication.widthClc(24, context),
                                          fontWeight: FontWeight.bold),
                                    )
                                        : Text(
                                      "Enter Password",
                                      style: TextStyle(
                                          fontSize: myApplication.widthClc(24, context),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    reset: reset,
                                  ), context);

                            }else if(state is SignUpFailure){

                              showTopSnackBar(Overlay.of(context),
                                  mySnackBar.error(message: state.errormessage));

                            }else if(state is SignUpCodeResend){

                              showTopSnackBar(Overlay.of(context),
                                  mySnackBar.success(message: state.successmessage));

                            }
                          },
                          builder: (context, state) {
                            if (state is SignUpCodeFillLoading) {

                              return  SizedBox(
                                height: myApplication.hightClc(48, context),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );

                            } else {

                              return confirmButton(
                                  ontap: () async {
                                    if(SignUpCubit.code!=null){
                                      BlocProvider.of<SignUpCubit>(context)
                                          .verifyCode(context);
                                    }else{
                                      showTopSnackBar(Overlay.of(context), const mySnackBar.error(message: "Enter The Code"));
                                    }
                                  },
                                  text: "Verify");

                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: myApplication.hightClc(68, context),
                  ),

                ],
              ))),
    );
  }
}
