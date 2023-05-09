import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class passwordFill extends StatelessWidget {
  final title;
  bool reset;

  passwordFill({Key? key,required  this.title,required this.reset}) : super(key: key);


  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: myApplication.backIcon(context, () {})),
        body: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  SizedBox(
                    height: myApplication.hightClc(220, context),
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state){
                        if(state is SignUpSuccess){
                          myApplication.congratulationsDialog(context);
                          Timer(Duration(milliseconds: 3100), () {
                            Navigator.pop(context);
                            showTopSnackBar(Overlay.of(context) , mySnackBar.success(message: "Sign Up Success"));
                            myApplication.navigateTo(mainScreen(), context);
                          });
                        }
                      },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFormField(
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
                                  onChanged: (val){
                                    SignUpCubit.pass = val;
                                  },
                                  obscureText: SignUpCubit.scure,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(75),
                                        borderSide: BorderSide(
                                          color: myColors.blu.withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(75)
                                      ),
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: SignUpCubit.scure ? Icon(Icons.visibility_off,color: Colors.grey,) : Icon(Icons.visibility,color: myColors.blu,),
                                        onPressed: () => BlocProvider.of<SignUpCubit>(context).changePassScure(),
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: myApplication.hightClc(25, context),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Confirm Password';
                                    } else if (value != SignUpCubit.pass) {
                                      return 'The password does not match';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  onChanged: (val){
                                    SignUpCubit.passConfirm = val;
                                  },                          obscureText: SignUpCubit.scure,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(75),
                                        borderSide: BorderSide(
                                          color: myColors.blu.withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(75)
                                      ),
                                      labelText: "Confirm Password",
                                      suffixIcon: IconButton(
                                        icon: SignUpCubit.scure ? Icon(Icons.visibility_off,color: Colors.grey,) : Icon(Icons.visibility,color: myColors.blu,),
                                        onPressed: () => BlocProvider.of<SignUpCubit>(context).changePassScure(),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: myApplication.hightClc(25, context),
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<SignUpCubit>(context).changeremember();
                            },

                            child: Row(
                              children: [
                                SizedBox(width: myApplication.widthClc(15, context),),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: SignUpCubit.remember ? myColors.blu : Colors.transparent,
                                    border: Border.all(color: myColors.blu),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SignUpCubit.remember
                                        ? Icon(
                                      Icons.check,
                                      size: 15.0,
                                      color: Colors.white,
                                    )
                                        : Icon(
                                      Icons.check,
                                      size: 15.0,
                                      color: myColors.blu,
                                    ),
                                  ),
                                ),
                                SizedBox(width: myApplication.widthClc(10, context),),
                                Text("Remember Me",style: TextStyle(fontSize: 12,color: myColors.blu)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: myApplication.hightClc(110, context),
                          ),
                          BlocBuilder<SignUpCubit, SignUpState>(
                            builder: (context, state) {
                              if(state is SignUpLoading){
                                return Container(
                                  height: 48,
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              }else{
                                return confirmButton(
                                    ontap: () {
                                      if(formkey.currentState!.validate()){
                                        BlocProvider.of<SignUpCubit>(context).signUp();
                                      }
                                    },
                                    text: reset ? "Confirm" : "Sign Up",);
                              }
                            },
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
      ),
      )
    );

  }
}
