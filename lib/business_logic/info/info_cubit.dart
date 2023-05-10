import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/constants/url.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {

  static File? image;
  static String fullName = "";
  static String nickName = "";
  static String PIN = "";
  static String ConfirmPIN = "";


  InfoCubit() : super(InfoInitial());

  final ImagePicker picker = ImagePicker();


  savePin(context){
    emit(InfoLoading());
    try{
      Timer(const Duration(seconds: 1), () {
        myApplication.navigateTo(const mainScreen(), context);
        emit(InfoSuccess());

      });
    }catch(e){
      emit(InfoFailure(errormessage: e.toString()));
    }

  }

  saveInfo()async{
    emit(InfoLoading());
    await CahchHelper.saveData(key: "fullName", value: "$fullName");
    await CahchHelper.saveData(key: "nickName", value: "$nickName");
    await CahchHelper.saveData(key: "photo", value: "${image != null ? image!.path : "no photo"}");

    emit(InfoSuccess());
  }

  uploadInfo()async{
    emit(InfoLoading());
    try{

      Dio dio = Dio();
      final token = await CahchHelper.getData(key: "token");

      final fullName = await CahchHelper.getData(key: "fullName");
      final nickName = await CahchHelper.getData(key: "nickName");
      final nationalId = await CahchHelper.getData(key: "nid");
      final birthDate = await CahchHelper.getData(key: "birthDate");
      final gender = await CahchHelper.getData(key: "gender");
      final age = await CahchHelper.getData(key: "age");
      final photo = await CahchHelper.getData(key: "photo");
      final city = await CahchHelper.getData(key: "city");
      final pin = PIN;


      var map = new Map<String, String>();
      map['fullName'] = '$fullName';
      map['nickName'] = '$nickName';
      map['nationalId'] = '$nationalId';
      map['birthDate'] = '$birthDate';
      map['gender'] = '$gender';
      map['age'] = '$age';
      map['photo'] = '$photo';
      map['city'] = '$city';
      map['pin'] = '$pin';

      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.patch("$URL/updateMe", data: map);

      emit(InfoSuccess());

    }on DioError catch (error){
      print(error.response);
      if(error.response!.statusCode == 500){
        // emit(InfoFailure(errormessage: "You tried to log in a while ago, try again later"));
        emit(InfoFailure(errormessage: error.response!.data["message"]));


      }else{
        emit(InfoFailure(errormessage: error.response!.data["message"]));

      }


    };
  }

  Future getImage(ImageSource media, context) async {

    XFile? selected = await picker.pickImage(source: media);
    if (selected != null) {
      image = File(selected.path);
      print("picked Image");
      await cropImage(imagefile: selected, context: context);
      emit(InfoInitial());

    }
  }

  Future cropImage({required XFile imagefile,required BuildContext context})async{

    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: imagefile.path,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Edit Photo',
              activeControlsWidgetColor: myColors.blu,
              cropFrameColor: myColors.blu,
              cropGridColor: myColors.blu,
              toolbarColor: myColors.softblu,
              toolbarWidgetColor: myColors.blu,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false
          ),
        ]
    );
    if(croppedImage == null) return null;
    image =  File(croppedImage.path);

  }
}
