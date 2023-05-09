import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_cash/helper/constants/myColors.dart';

class Mythems{
  static final lighttheme = ThemeData(
    dialogBackgroundColor: Colors.white,
      fontFamily: "PlusJakartaSans",
      hintColor: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(75),
                )
            )
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color:Colors.black,fontSize: 25),
        bodyMedium: TextStyle(color: Colors.black,fontSize: 18),
        bodySmall: TextStyle(color: Colors.black,fontSize: 16),
          labelSmall: TextStyle(fontSize: 14,color: Colors.black)

      ),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontFamily: "PlusJakartaSans",color: Colors.black,fontSize: 22),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
              size: 25,
        )
      ),
      scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: myColors.blu), bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white)
  );


  static final darktheme = ThemeData(
    dialogBackgroundColor: myColors.blk,

    bottomAppBarTheme: const BottomAppBarTheme(color: myColors.blk,),
      fontFamily: "PlusJakartaSans",
      hintColor: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
          )
      ),
    ),
    textTheme: const TextTheme(

      bodyLarge: TextStyle(color:Colors.white,fontSize: 25),
      bodyMedium: TextStyle(color: Colors.white,fontSize: 18),
      bodySmall: TextStyle(color: Colors.white,fontSize: 16),
      labelSmall: TextStyle(fontSize: 14,color: Colors.white)

    ),
      iconTheme: const IconThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: "PlusJakartaSans",color: Colors.white,fontSize: 22),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: myColors.blk,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 25,
          )
      ),
      scaffoldBackgroundColor: myColors.blk,
      colorScheme: ColorScheme.fromSeed(seedColor: myColors.blu),

  );
}