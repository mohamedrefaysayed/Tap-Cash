import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/data/web_services/sign_in_services.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  static String email="";
  static String pass = "";
  static bool scure = true;
  static bool remember = false;

  final sigInService = signInWebServices();


  signIn(){
    emit(SignInLoading());
      sigInService.logInRequest(email: email, pass: pass).then((value) {
        if(value != null && value.status == "success"){
          emit(SignInSuccess());
        }else{
          emit(SignInFailure(errormessage: "error"));
        }
      });
  }



  changePassScure(){
    scure = !scure;
    emit(SignInInitial());
  }

  changeremember(){
    remember = !remember;
    emit(SignInInitial());
  }
}
