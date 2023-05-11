// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_In/sign_in_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/email_Fill.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class signIn extends StatelessWidget {
  signIn({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () => myApplication.keyboardFocus(context),

      child: Scaffold(

          appBar: AppBar(leading: myApplication.backIcon(context, () {})),

          body: SingleChildScrollView(

            scrollDirection: Axis.vertical,

            child: Container(

              margin: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Login To Your",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Account",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: myApplication.hightClc(220, context),
                  ),

                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Email';
                            } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                              return 'Enter Valid Email';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.bodySmall,
                          onChanged: (val) {
                            SignInCubit.email = val;
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
                        SizedBox(
                          height: myApplication.hightClc(25, context),
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Valid Password';
                                } else if (value.length < 6) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              style: Theme.of(context).textTheme.bodySmall,
                              onChanged: (val) {
                                SignInCubit.pass = val;
                              },
                              obscureText: SignInCubit.scure,
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
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    icon: SignInCubit.scure
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: myColors.blu,
                                          ),
                                    onPressed: () =>
                                        BlocProvider.of<SignInCubit>(context)
                                            .changePassScure(),
                                  )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: myApplication.hightClc(25, context),
                  ),

                  BlocBuilder<SignInCubit, SignInState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SignInCubit>(context).changeremember();
                        },
                        child: Row(
                          children: [

                            SizedBox(
                              width: myApplication.widthClc(15, context),
                            ),

                            Container(

                              height: myApplication.hightClc(25, context),
                              width: myApplication.widthClc(25, context),
                              decoration: BoxDecoration(
                                color: SignInCubit.remember
                                    ? myColors.blu
                                    : Colors.transparent,
                                border: Border.all(color: myColors.blu),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SignInCubit.remember
                                    ? const Icon(
                                        Icons.check,
                                        size: 15.0,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.check,
                                        size: 15.0,
                                        color: myColors.blu,
                                      ),
                              ),
                            ),

                            SizedBox(
                              width: myApplication.widthClc(10, context),
                            ),

                            const Text("Remember Me",
                                style:
                                    TextStyle(fontSize: 12, color: myColors.blu)),

                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(
                    height: myApplication.hightClc(90, context),
                  ),

                  BlocConsumer<SignInCubit, SignInState>(

                    listener: (context, state) {
                      if (state is SignInSuccess) {
                        showTopSnackBar(Overlay.of(context),
                            const mySnackBar.success(message: "Sign In Success"));
                        myApplication.navigateTo(const mainScreen(), context);
                      }else if(state is SignInFailure){
                        showTopSnackBar(Overlay.of(context),
                             mySnackBar.error(message: state.errormessage));                    }
                    },

                    builder: (context, state) {
                      return BlocBuilder<SignInCubit, SignInState>(
                        builder: (context, state) {
                          if (state is SignInLoading) {
                            return  SizedBox(
                              height: myApplication.hightClc(48, context),
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            return confirmButton(
                                ontap: () {
                                  if (formkey.currentState!.validate()) {
                                    BlocProvider.of<SignInCubit>(context)
                                        .signIn();
                                  }
                                },
                                text: "Sign In");
                          }
                        },
                      );
                    },
                  ),

                  SizedBox(
                    height: myApplication.hightClc(32, context),
                  ),

                  Center(
                    child: TextButton(
                        onPressed: () => myApplication.navigateTo(
                            emailFill(

                              title: Text(
                                "Forget Password",
                                style: TextStyle(
                                    fontSize: myApplication.widthClc(24, context),
                                    fontWeight: FontWeight.bold),
                              ),

                              reset: true,
                            ),
                            context),

                        child: Text(
                          "Forget The Password ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: myApplication.widthClc(14, context),
                              decoration: TextDecoration.underline),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
