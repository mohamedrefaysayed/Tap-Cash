import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/password_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  static String phoneNumber="";
  static String code="";
  static bool phoneIsVaild = false;
  static bool verify = false;
  static bool cansend = false;
  static bool scure = true;
  static bool remember = false;
  static String pass = "";
  static String passConfirm = "";
  SignUpCubit() : super(SignUpInitial());



  signUp(){
    emit(SignUpLoading());
    if(pass == passConfirm && pass.isNotEmpty){
      try{
        Timer(Duration(seconds: 2), () { emit(SignUpSuccess()); });
      } catch(e){
        emit(SignUpFailure(errormessage: e.toString()));
      }
    }else{
      emit(SignUpFailure(errormessage: "The password does not match"));
    }
  }

  signUpStart(){
    emit(SignUpLoading());
    try{
      Timer(Duration(seconds: 1), () { emit(SignUpSuccess()); });
    } catch(e){
      emit(SignUpFailure(errormessage: e.toString()));
    }
  }

  checkNumber(){
    if(phoneNumber.length==13){
      phoneIsVaild = true;
    }else{
      phoneIsVaild = false;
    }
    emit(SignUpPhoneFill());
  }

  sentVerfication()async{
    emit(SignUpCodeFill());
  }
  verifyCode(BuildContext context,reset){
    if (SignUpCubit.code.isNotEmpty) {
      emit(SignUpCodeFillLoading());
      Timer(Duration(seconds: 2), () {
        showTopSnackBar(
          Overlay.of(context) ,
          mySnackBar.success(
              message: "confirmed !"),
        );
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
        emit(SignUpCodeFill());
      });
    } else {
      showTopSnackBar(
        Overlay.of(context) ,
        mySnackBar.error(
            message: "Write the code"),
      );
      emit(SignUpCodeFill());
    }
  }

  allowSend(){
    cansend = true;
    emit(SignUpCodeFill());
  }
  blockSend(){
    cansend = false;
    emit(SignUpCodeFill());
  }

  changePassScure(){
    scure = !scure;
    emit(SignUpPassFill());
  }

  changeremember(){
    remember = !remember;
    emit(SignUpPassFill());
  }


}
