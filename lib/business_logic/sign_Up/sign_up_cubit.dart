import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eg_nid/eg_nid.dart';
import 'package:flutter/material.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/data/dio_helper.dart';
import 'package:tap_cash/data/models/signUpModel.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/url.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/password_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

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


  signUpModel?  signupmodel;


  signUp(){
    emit(SignUpLoading());
    if(pass == passConfirm && pass.isNotEmpty){
      try{
      } catch(e){
        emit(SignUpFailure(errormessage: e.toString()));
      }
    }else{
    }
  }

  signUpStart()async{
    emit(SignUpLoading());
    try{
      Map<String,String> json = {
        "email":email,
      };

      print("email: $email");
      final response = await DioHelper.postData(url:"$URL/signup", data: json);
      signupmodel = signUpModel.fromJson(response.data);

      CahchHelper.saveData(key: "token", value: signupmodel!.token);

      emit(SignUpSuccess(successmessage: signupmodel!.message!));


    }on DioError catch (error){

      emit(SignUpFailure(errormessage: error.response!.data["message"]));

    };
  }



  signUpContinue()async {
    emit(SignUpLoading());
    CahchHelper.saveData(key: "nid", value: "$Id");
    Timer(const Duration(seconds: 1), () { emit(SignUpSuccess(successmessage: "")); });
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
      Timer(const Duration(seconds: 2), () {
        showTopSnackBar(
          Overlay.of(context) ,
          const mySnackBar.success(
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
        const mySnackBar.error(
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
