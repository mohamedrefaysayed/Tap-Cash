import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eg_nid/eg_nid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/data/web_services/sign_Up_services.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/password_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  static String Id="30105141900138";
  static String email="";
  static String code="";
  static bool verify = false;
  static bool cansend = false;
  static bool scure = true;
  static bool remember = false;
  static String pass = "";
  static String passConfirm = "";
  String? age;
  String? birthDate;
  String? city;
  String? gender;


  SignUpCubit() : super(SignUpInitial());



  final signUpSersevices = signUpWebServices();




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
    Timer(Duration(seconds: 1), () {
      emit(SignUpSuccess());
    });
  }

  getDataFromId(){
    var idData = NIDInfo(nid: Id);
    birthDate = idData.birthDay.toString();
    age = (DateTime.now().year - idData.birthDay.year).toString();
    gender = idData.sex;
    city = idData.city;
    print(birthDate);
    print(age);
    print(gender);
    print(city);


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
