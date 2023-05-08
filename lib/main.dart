import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/QR/qr_cubit.dart';
import 'package:tap_cash/business_logic/add&send/add_send_cubit.dart';
import 'package:tap_cash/business_logic/addMonyAmount/add_mony_amount_cubit.dart';
import 'package:tap_cash/business_logic/creditCard/credit_card_cubit.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/business_logic/selctor/selector_cubit.dart';
import 'package:tap_cash/business_logic/sign_In/sign_in_cubit.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/business_logic/smartCards/smart_cards_cubit.dart';
import 'package:tap_cash/business_logic/wallet/wallet_cubit.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/my_thems.dart';
import 'package:tap_cash/presentation/auth/sign_In.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

void main() {
  runApp(const Tap_Cash());
}

class Tap_Cash extends StatelessWidget {
  const Tap_Cash({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SelectorCubit()),
        BlocProvider(create: (context) => InfoCubit()),
        BlocProvider(create: (context) => CreditCardCubit()),
        BlocProvider(create: (context) => WalletCubit()),
        BlocProvider(create: (context) => AddSendCubit()),
        BlocProvider(create: (context) => SmartCardsCubit()),
        BlocProvider(create: (context) => AddMonyAmountCubit()),
        BlocProvider(create: (context) => QrCubit()),

      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //top status bar
          systemNavigationBarColor: myColors.blk, // navigation bar color, the one Im looking for
          statusBarIconBrightness: Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
        ),
        child: MaterialApp(
          themeMode: ThemeMode.system,
          theme: Mythems.lighttheme,
          darkTheme: Mythems.darktheme,
          debugShowCheckedModeBanner: false,
          title: 'Tap Cash',
          home:  mainScreen(),
        ),
      ),
    );
  }
}

