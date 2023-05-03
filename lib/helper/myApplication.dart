// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


DateTime? currentBackPressTime;

class myApplication {

  static Widget backIcon(BuildContext context,Function fun){
    return IconButton(onPressed: () {
      myApplication.keyboardFocus(context);
      Timer(Duration(milliseconds: 150), () {
        Navigator.pop(context);
        fun;
      },);
    }, icon: Icon(Icons.arrow_back_ios_new_sharp));
  }

  static double hightClc(int myHeight, BuildContext context) {
    return MediaQuery.of(context).size.height * myHeight / 856.7272727272727;
  }

  static double widthClc(int myWidth, BuildContext context) {
    return MediaQuery.of(context).size.width * myWidth / 392.72727272727275;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }
  static push_left(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
              position:
              Tween(begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
                  .animate(a),
              child: c,
            )),
      );

  static push_up(BuildContext context, Widget widget, {data}) => Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position:
                      Tween(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
                          .animate(a),
                  child: c,
                )),
      );

  static keyboardFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  static noInternet(context){
    return Center(
      child: Container(
        color: myColors.blu,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off,size: 150,color: myColors.blu,),
            Text("لا يوجد اتصال بالانترنت",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            SizedBox(height: 30,),
            TextButton(
                onPressed: (){
                },
                child: Text("اعادة المحاولة",style: TextStyle(color: Colors.white,fontSize: 22),)),
          ],
        ),
      ),
    );
  }
  static Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showTopSnackBar(Overlay.of(context),
          const mySnackBar.error(message: "اضغط مره اخرى للخروج"));
      return Future.value(false);
    }
    return Future.value(true);
  }
  static congratulationsDialog(context) {
    AwesomeDialog(
      autoHide: Duration(seconds: 3),
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: myApplication.widthClc(40, context)),
        height: myApplication.hightClc(445, context),
        width: myApplication.widthClc(300, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/congratulations.png"),
            SizedBox(height: 20,),
            Text("your account is ready to use you will be redirected to the homepage",style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: myColors.blu,),
          ],
        ),
      ),
      context: context,
    ).show();
  }

  static imageDialog(context) {
    AwesomeDialog(
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: myApplication.widthClc(40, context)),
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Please Choose Photo',
              style: Theme.of(context).textTheme.bodyMedium

            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: myColors.softblu),
              //if user click this button, user can upload image from gallery
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<InfoCubit>(context).getImage(ImageSource.gallery, context);

              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Icon(
                    Icons.image,
                    color: myColors.blu,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: myColors.softblu),
              //if user click this button. user can upload image from camera
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<InfoCubit>(context)
                    .getImage(ImageSource.camera, context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Camera',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Icon(
                    Icons.camera,
                    color: myColors.blu,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      context: context,
    ).show();
  }





}
