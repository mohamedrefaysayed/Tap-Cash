// ignore_for_file: camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/auth/id_Fill.dart';
import 'package:tap_cash/presentation/auth/sign_In.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: Container(

          margin: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: myApplication.hightClc(100, context),
              ),

              SizedBox(
                height: myApplication.hightClc(151, context),
                width: myApplication.widthClc(151, context),
                child: Image.asset("assets/Tap_Cah-Icon.png"),
              ),

              SizedBox(
                height: myApplication.hightClc(110, context),
              ),

              Text(
                "Change your financial",
                style: TextStyle(
                    fontSize: myApplication.widthClc(28, context),
                    fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "future  ",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(28, context),
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Join Now",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(28, context),
                        fontWeight: FontWeight.bold,
                        color: myColors.blu),
                  ),

                ],
              ),

              SizedBox(
                height: myApplication.hightClc(27, context),
              ),

              Text(
                "Control of your finances with our secure and ",
                style: TextStyle(fontSize: myApplication.widthClc(12, context)),
              ),

              SizedBox(
                height: myApplication.hightClc(13, context),
              ),

              Text(
                "user-  friendly app ",
                style: TextStyle(fontSize: myApplication.widthClc(12, context)),
              ),

              SizedBox(
                height: myApplication.hightClc(65, context),
              ),

              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {

                  if(state is SignUpSuccess){
                   myApplication.navigateTo(idFill(), context);

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
                          BlocProvider.of<SignUpCubit>(context).emit(SignUpLoading());
                          Timer(const Duration(seconds: 1), () {
                            BlocProvider.of<SignUpCubit>(context).emit(SignUpSuccess(successmessage: ""));
                          });
                        }, text: "Sign Up",
                    );

                  }
                },
              ),

              SizedBox(
                height: myApplication.hightClc(32, context),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    "Already  Have  An  Account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: myApplication.widthClc(14, context)),
                  ),

                  TextButton(

                      onPressed: () => myApplication.navigateTo(signIn(), context),

                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: myApplication.widthClc(14, context),
                            decoration: TextDecoration.underline),
                      )
                  )
                ],
              ),
            ],
          )),
    );
  }
}
