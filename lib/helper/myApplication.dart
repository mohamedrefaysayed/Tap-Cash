// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/credit_Card/myCreditCard.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

DateTime? currentBackPressTime;

class myApplication {



  static creditCard(cardNumber,expiryDate,cardHolderName,cvvCode,scure){

    bool useGlassMorphism = false;
    bool isCvvFocused = false;
    UnderlineInputBorder? border = UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
    return myCreditCardWidget(

      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'halter',
        fontSize: 12,
        package: 'flutter_credit_card',
      ),

      glassmorphismConfig:
      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      bankName: 'Tap Cash',
      frontCardBorder: !useGlassMorphism
          ? Border.all(color: Colors.grey)
          : null,
      backCardBorder: !useGlassMorphism
          ? Border.all(color: Colors.grey)
          : null,
      showBackView: isCvvFocused,
      obscureCardNumber: scure,
      obscureCardCvv: scure,
      isHolderNameVisible: true,
      cardBgColor: myColors.blu,
      backgroundImage: "assets/card/Card_pg.png",
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange:
          (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/card/mastercard.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }

  static Widget backIcon(BuildContext context, Function fun) {
    return IconButton(
        onPressed: () {
          myApplication.keyboardFocus(context);
          Timer(
            const Duration(milliseconds: 150),
            () {
              Navigator.pop(context);
              fun;
            },
          );
        },
        icon: const Icon(Icons.arrow_back_ios_new_sharp));
  }

  static Future push_fade(BuildContext context, Widget widget, {data}) async => Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (_, a, b, c) =>
          FadeTransition(opacity: a, child: c),
    ),
  );

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
            const Icon(
              Icons.wifi_off,
              size: 150,
              color: myColors.blu,
            ),
            const Text(
              "لا يوجد اتصال بالانترنت",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
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
      transitionAnimationDuration: const Duration(seconds: 1),
      animType: AnimType.bottomSlide,
      autoHide: const Duration(seconds: 3),
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
            const SizedBox(
              height: 20,
            ),
            Text(
              "your account is ready to use you will be redirected to the homepage",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
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
      transitionAnimationDuration: const Duration(seconds: 1),
      animType: AnimType.bottomSlide,
      autoHide: const Duration(seconds: 2),
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: myColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(1, 1.5),
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
            const SizedBox(
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
                children: const [
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
                children: const [
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
      autoHide: const Duration(seconds: 5),
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
                      color: myColors.shadow,
                      blurRadius: 10,
                      offset: const Offset(1, 1.5),
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
                      color: myColors.shadow,
                      blurRadius: 10,
                      offset: const Offset(1, 1.5),
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
