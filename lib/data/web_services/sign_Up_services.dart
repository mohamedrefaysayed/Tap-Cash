import 'package:dio/dio.dart';
import 'package:tap_cash/data/models/putPasswordsSignUpModel.dart';
import 'package:tap_cash/data/models/signUpModel.dart';
import 'package:tap_cash/data/models/verfiySignUpModel.dart';
import 'package:tap_cash/helper/constants/url.dart';

class signUpWebServices {
  late Dio dio;

  signUpWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: URL,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(option);
  }



  Future<signUpModel?> signUpRequest(
      {required String email}) async {

    Map<String,String> json = {
      "email":email,
    };

    print("email: $email");

    Response response = await dio.post("signup",data: json);
    if(response.statusCode == 200){
      var thisresult = signUpModel.fromJson(response.data);
      print(response.toString());
      return thisresult;
    }else if(response.statusCode == 401){
      print("un authrized");
    }else{
      throw("error : ${response.statusCode}");
    }

  }


  Future<verfiySignUpModel?> verfiySignUpRecuest(
      {required String code}) async {

    Map<String,String> json = {
      "code":code
    };

    print("code: $code");

    Response response = await dio.post("signup",data: json);
    if(response.statusCode == 200){
      var thisresult = verfiySignUpModel.fromJson(response.data);
      print(response.toString());
      return thisresult;
    }else if(response.statusCode == 401){
      print("un authrized");
    }else{
      throw("error : ${response.statusCode}");
    }

  }
  Future<putPasswordsSignUpModel?> putPasswordsSignUpRecuest(
      {required String pass,required confirmpass}) async {

    Map<String,String> json = {
      "password": pass,
      "passwordConfirm": confirmpass
    };

    print("pass: $pass \n confirmpass: $confirmpass");

    Response response = await dio.post("signup",data: json);
    if(response.statusCode == 200){
      var thisresult = putPasswordsSignUpModel.fromJson(response.data);
      print(response.toString());
      return thisresult;
    }else if(response.statusCode == 401){
      print("un authrized");
    }else{
      throw("error : ${response.statusCode}");
    }

  }
}
