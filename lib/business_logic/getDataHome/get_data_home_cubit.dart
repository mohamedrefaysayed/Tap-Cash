import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/data/models/userDataModel.dart';
import 'package:tap_cash/helper/constants/url.dart';

part 'get_data_home_state.dart';

class GetDataHomeCubit extends Cubit<GetDataHomeState> {
  GetDataHomeCubit() : super(GetDataHomeInitial());

  getUserData()async{
    Dio dio = Dio();

    final token = await CahchHelper.getData(key: "token");

    print(token);
    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.patch("$URL/wallets");
    if(response == null){
      print("مش شغال يا كبير");
    }

    userDataModel.fromJson(response.data);
    print(response);

  }
}

class getData{
  static  userDataModel? userdataModel;
  static getDataInit(context){
    BlocProvider.of<GetDataHomeCubit>(context).getUserData();

  }
}
