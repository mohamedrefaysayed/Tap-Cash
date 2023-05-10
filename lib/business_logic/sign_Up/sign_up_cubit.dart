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
import 'package:tap_cash/presentation/auth/sign_Up.dart';
import 'package:tap_cash/presentation/splash/splashLogo.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static bool isKid = false;

  static String Id="";
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



  signUpSendVerfCode()async{
    emit(SignUpEmailFillLoading());
    try{
      Map<String,String> json = {
        "email":email,
      };

      print("email: $email");
      final response = await DioHelper.postData(url:"$URL/signup", data: json);
      signupmodel = signUpModel.fromJson(response.data);

      CahchHelper.saveData(key: "token", value: signupmodel!.token);

      emit(SignUpEmailFillSuccess(successmessage: signupmodel!.message!));


    }on DioError catch (error){
      print(error.response);
      if(error.response!.statusCode == 500){
        emit(SignUpFailure(errormessage: "You tried to log in a while ago, try again later"));

      }else{
        emit(SignUpFailure(errormessage: error.response!.data["message"]));

      }


    };
  }

  logout(context){
    myApplication.navigateToRemove(context, splashLogo());
    CahchHelper.updateData(key: "isLogin", value: false);
  }


  verifyCode(BuildContext context)async{
    emit(SignUpCodeFillLoading());
    try{
      final token = await CahchHelper.getData(key: "token");

      Map<String,String> jsonToken = {
        'Authorization': 'Bearer $token'
      };
      Map<String,String> json = {
        "code": "$code"
      };

      print("email: $code");
      final response = await DioHelper.postDataWithHeader(url:"$URL/verfiySignUp", data: json,header: jsonToken);
      signupmodel = signUpModel.fromJson(response.data);

      print("success");

      emit(SignUpCodeFillSuccess(successmessage: "Confirmed"));

    }on DioError catch (error){
      print(error.response);
      if(error.response!.statusCode == 500){
        emit(SignUpFailure(errormessage: "You tried to log in a while ago, try again later"));

      }else{
        emit(SignUpFailure(errormessage: error.response!.data["message"]));

      }


    };
  }

  resendCode(BuildContext context)async{
    try{
      final token = await CahchHelper.getData(key: "token");

      Map<String,String> json = {
        'Authorization': 'Bearer $token'
      };

      final response = await DioHelper.postDataWithHeader(url:"$URL/resendSignup",header: json);
      signupmodel = signUpModel.fromJson(response.data);

      emit(SignUpCodeResend(successmessage: signupmodel!.message!));

    }on DioError catch (error){
      print(error.response);
      if(error.response!.statusCode == 500){

        emit(SignUpFailure(errormessage: "You tried in a while ago, try again later"));

      }else{

        emit(SignUpFailure(errormessage: error.response!.data["message"]));

      }

    };
  }

  confirmPass(BuildContext context)async{
    emit(SignUpPassFillLoading());
    try{
      CahchHelper.updateData(key: "isLogin", value: remember);
      final token = await CahchHelper.getData(key: "token");

      Map<String,String> jsonToken = {
        'Authorization': 'Bearer $token'
      };
      Map<String,String> json = {
        "password": "$pass",
        "passwordConfirm": "$passConfirm"
      };

      print("email: $code");
      final response = await DioHelper.postDataWithHeader(url:"$URL/putPasswordsSignUp", data: json,header: jsonToken);
      signupmodel = signUpModel.fromJson(response.data);

      print("success");

      emit(SignUpPassFillSuccess(successmessage: "Saved"));

      CahchHelper.updateData(key: "isLogin", value: true);

    }on DioError catch (error){
      print(error.response);
      if(error.response!.statusCode == 500){
        emit(SignUpFailure(errormessage: "You tried to log in a while ago, try again later"));

      }else{
        emit(SignUpFailure(errormessage: error.response!.data["message"]));

      }


    };
  }

  saveId()async {
    emit(SignUpLoading());
    await CahchHelper.saveData(key: "nid", value: Id);
    getDataFromId();
  }

  getDataFromId()async{

    var idData = NIDInfo(nid: Id);
    birthDate = idData.birthDay.toString();
    age = (DateTime.now().year - idData.birthDay.year).toString();
    gender = idData.sex;
    city = idData.city;
    await CahchHelper.saveData(key: "birthDate", value: birthDate);
    await CahchHelper.saveData(key: "age", value: age);
    await CahchHelper.saveData(key: "gender", value: gender);
    await CahchHelper.saveData(key: "city", value: city);

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
