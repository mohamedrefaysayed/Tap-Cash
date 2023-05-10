import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/data/dio_helper.dart';
import 'package:tap_cash/data/models/sign_In_Model.dart';
import 'package:tap_cash/helper/constants/url.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  static String email="";
  static String pass = "";
  static bool scure = true;
  static bool remember = false;

  signInModel? signinmodel;


  signIn() async{
    CahchHelper.updateData(key: "isLogin", value: remember);
    emit(SignInLoading());

   try{
     Map<String,String> json = {
       "emailOrNationalId":email,
       "password":pass
     };

     final response = await DioHelper.postData(url:"$URL/login", data: json);
     signinmodel = signInModel.fromJson(response.data);
     updateData();
     emit(SignInSuccess());

   }on DioError catch (error){

     emit(SignInFailure(errormessage: error.response!.data["message"]));

   };
  }


  updateData(){
    CahchHelper.saveData(key: "token", value: signinmodel!.token);
    CahchHelper.saveData(key: "photo", value: signinmodel!.data!.user!.photo);
    CahchHelper.saveData(key: "id", value: signinmodel!.data!.user!.sId);
    CahchHelper.saveData(key: "role", value: signinmodel!.data!.user!.role);
    CahchHelper.saveData(key: "email", value: signinmodel!.data!.user!.email);
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
