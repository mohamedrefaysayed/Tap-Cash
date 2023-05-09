import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/code_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class emailFill extends StatelessWidget {
  final title;
  bool reset;
  emailFill({Key? key, required this.title, required this.reset})
      : super(key: key);

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(
                  height: myApplication.hightClc(170, context),
                ),
                Form(
                  key: formkey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter Valid Email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: Theme.of(context).textTheme.bodySmall,
                    onChanged: (val) {
                      SignUpCubit.email = val;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(75),
                        borderSide: BorderSide(
                          color: myColors.blu.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(75)),
                      labelText: "Email",
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if(state is SignUpSuccess){
                          showTopSnackBar(
                              Overlay.of(context),
                              mySnackBar.success(
                                  message: state.successmessage ));
                        }else if(state is SignUpFailure){
                          showTopSnackBar(
                              Overlay.of(context),
                              mySnackBar.error(
                                message: state.errormessage ,));
                        }
                      },
                      builder: (context, state) {
                        if(state is SignUpLoading){
                          return const SizedBox(
                            height: 48,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }else{
                          return confirmButton(
                            ontap: () {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<SignUpCubit>(context)
                                    .signUpStart();
                              }
                            },
                            text: reset ? "send" : "Continue",
                          );
                        }
                      },
                    ),

                    SizedBox(
                      height: myApplication.hightClc(25, context),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
