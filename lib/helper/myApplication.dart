// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

DateTime? currentBackPressTime;

class myApplication {
  static Widget backIcon(BuildContext context, Function fun) {
    return IconButton(
        onPressed: () {
          myApplication.keyboardFocus(context);
          Timer(
            Duration(milliseconds: 150),
            () {
              Navigator.pop(context);
              fun;
            },
          );
        },
        icon: Icon(Icons.arrow_back_ios_new_sharp));
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

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
      );

  static navigateToReplace(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  static push_left(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position: Tween(
                          begin: const Offset(-1.0, 0.0),
                          end: const Offset(0.0, 0.0))
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
                  position: Tween(
                          begin: const Offset(0.0, -1.0),
                          end: const Offset(0.0, 0.0))
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

  static noInternet(context) {
    return Center(
      child: Container(
        color: myColors.blu,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 150,
              color: myColors.blu,
            ),
            Text(
              "لا يوجد اتصال بالانترنت",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "اعادة المحاولة",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
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
          const mySnackBar.error(message: "Press again to exit"));
      return Future.value(false);
    }
    return Future.value(true);
  }

  static congratulationsDialog(context) {
    AwesomeDialog(
      transitionAnimationDuration: Duration(seconds: 1),
      animType: AnimType.bottomSlide,
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
            SizedBox(
              height: 20,
            ),
            Text(
              "your account is ready to use you will be redirected to the homepage",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: myColors.blu,
            ),
          ],
        ),
      ),
      context: context,
    ).show();
  }

  static doneDialog(context, text,onDone) {
    AwesomeDialog(
      onDismissCallback: onDone,
      width: 300,
      transitionAnimationDuration: Duration(seconds: 1),
      animType: AnimType.bottomSlide,
      autoHide: Duration(seconds: 2),
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: myApplication.hightClc(250, context),
        width: myApplication.widthClc(200, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: myApplication.hightClc(131, context),
              width: myApplication.widthClc(131, context),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(1, 1.5),
                    spreadRadius: 10,
                  )
                ],
              ),
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: myApplication.widthClc(60, context),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: myApplication.widthClc(16, context),fontWeight: FontWeight.w700)
              ),
            ),
          ],
        ),
      ),
      context: context,
    ).show();
  }

  static imageDialog(context) {
    AwesomeDialog(
      animType: AnimType.bottomSlide,
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: myApplication.widthClc(40, context)),
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Please Choose Photo',
                style: Theme.of(context).textTheme.bodyMedium),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: myColors.softblu),
              //if user click this button, user can upload image from gallery
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<InfoCubit>(context)
                    .getImage(ImageSource.gallery, context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Gallery',
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.image,
                    color: myColors.blu,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: myColors.softblu),
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
                    style: TextStyle(color: Colors.black),
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

  static confirmDialog(context, title, buttonText, textColor, ontap) {
    AwesomeDialog(
      dialogBorderRadius: BorderRadius.circular(20),
      autoHide: Duration(seconds: 5),
      animType: AnimType.bottomSlide,
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: myApplication.widthClc(17, context)),
        height: myApplication.hightClc(269, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: myApplication.widthClc(16, context))),
            GestureDetector(
              onTap: ontap,
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(1, 1.5),
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: myApplication.widthClc(16, context),
                        fontWeight: FontWeight.w600,
                        color: textColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(1, 1.5),
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: myApplication.widthClc(16, context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      context: context,
    ).show();
  }
}
