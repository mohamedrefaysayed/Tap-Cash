import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/presentation/main_Screen/intrest_Screen.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  static String phoneNumber="";
  static String pass = "";
  static bool scure = true;
  static bool remember = false;


  signIn(){
    emit(SignInLoading());
    try{
      if(true){
        Timer(Duration(seconds: 2), () {emit(SignInSuccess()); });
      }

    }catch(e){
      emit(SignInFailure(errormessage: e.toString()));
    }
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
