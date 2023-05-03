import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tap_cash/helper/MyColors.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {

  static File? image;


  InfoCubit() : super(InfoInitial());

  final ImagePicker picker = ImagePicker();

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
