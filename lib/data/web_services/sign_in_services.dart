import 'package:dio/dio.dart';
import 'package:tap_cash/data/models/sign_In_Model.dart';
import 'package:tap_cash/helper/constrains.dart';

class signInWebServices {
  late Dio dio;

  signInWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(option);
  }

  Future<signInModel?> logInRequest(
      {required String email, required String pass}) async {

    Map<String,String> json = {
      "emailOrNationalId":email,
      "password":pass,
    };

    print("email: $email \n pass: $pass");

    Response response = await dio.post("login",data: json);
    if(response.statusCode == 200){
      result = signInModel.fromJson(response.data);
      print(response.toString());
      return result;
    }else if(response.statusCode == 401){
      print("un authrized");
    }else{
      throw("error : ${response.statusCode}");
    }

  }
}
