// ignore_for_file: file_names, camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/auth/email_Fill.dart';
import 'package:tap_cash/presentation/more/privacyPolicy.dart';

class idFill extends StatelessWidget {
  idFill({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),

      child: WillPopScope(

        onWillPop: () {
          return Future.value(true);
        },

        child: BlocBuilder<SignUpCubit, SignUpState>(

          builder: (context, state) {

            return Scaffold(

              appBar: AppBar(leading: myApplication.backIcon(context, () {})),

              body: Container(

                margin: const EdgeInsets.all(20),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      SignUpCubit.isKid
                          ? "Enter your parent ID number"
                          : "Enter Your ID Number",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(170, context),
                    ),

                    Form(

                      key: formkey,

                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your ID Number';
                          } else if (value.length != 14) {
                            return 'Enter Valid ID Number (14 number)';
                          } else {
                            return null;
                          }
                        },

                        keyboardType: TextInputType.number,

                        style: Theme.of(context).textTheme.bodySmall,

                        onChanged: (val) {
                          SignUpCubit.Id = val;
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
                          labelText: "ID",
                        ),

                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(32, context),
                    ),

                    GestureDetector(

                      onTap: () {
                        SignUpCubit.isKid = !SignUpCubit.isKid;
                        BlocProvider.of<SignUpCubit>(context)
                            .emit(SignUpIdFill());
                      },

                      child: Container(

                        margin: const EdgeInsets.symmetric(horizontal: 20),

                        child: Text(

                          SignUpCubit.isKid ? "I have ID number" : "I don’t have ID number",
                          style: TextStyle(
                              color: myColors.blu,
                              fontWeight: FontWeight.w400,
                              fontSize: myApplication.widthClc(14, context),
                              decoration: TextDecoration.underline),
                        ),

                      ),
                    ),
                    Expanded(

                      child: Column(
                        children: [

                          const Spacer(),

                          BlocConsumer<SignUpCubit, SignUpState>(
                            listener: (context, state) {

                              if (state is SignUpIdFillSuccess) {
                                myApplication.navigateTo(
                                    emailFill(

                                        title: Text(
                                          "Sign Up With Your Email",
                                          style: TextStyle(
                                              fontSize: myApplication.widthClc(
                                                  24, context),
                                              fontWeight: FontWeight.bold),
                                        ),

                                        reset: false),
                                    context);
                              }
                            },
                            builder: (context, state) {

                              if (state is SignUpIdFillLoading) {

                                return const Center(

                                  child: CircularProgressIndicator(
                                    color: myColors.blu,
                                  ),
                                );
                              }
                              return confirmButton(

                                  ontap: () {

                                    if (formkey.currentState!.validate()) {

                                      if(!SignUpCubit.isKid){

                                        CahchHelper.saveData(key: "isKid", value: false);
                                        BlocProvider.of<SignUpCubit>(context)
                                            .saveId();
                                        BlocProvider.of<SignUpCubit>(context)
                                            .emit(SignUpIdFillLoading());
                                        Timer(const Duration(seconds: 1), () {
                                          BlocProvider.of<SignUpCubit>(context)
                                              .emit(SignUpIdFillSuccess());
                                        });

                                      }else{

                                        CahchHelper.saveData(key: "isKid", value: true);

                                      }
                                    }
                                  },

                                  text: "Continue");
                            },
                          ),

                          SizedBox(
                            height: myApplication.hightClc(25, context),
                          ),

                          TextButton(
                            onPressed: () {
                              myApplication.navigateTo(const privacyPolicy(), context);
                            },

                            child: Text(
                              "terms and conditions & privacy policy",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: myApplication.widthClc(12, context),
                                  decoration: TextDecoration.underline),
                            ),

                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
