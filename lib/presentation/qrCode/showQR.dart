// ignore_for_file: file_names, camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tap_cash/business_logic/QR/qr_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/small_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class showQrCode extends StatelessWidget {
  const showQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => myApplication.keyboardFocus(context),
        child: WillPopScope(
            onWillPop: () {
              BlocProvider.of<QrCubit>(context).emit(QrInitial());
              return Future.value(true);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        BlocProvider.of<QrCubit>(context).emit(QrInitial());
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_sharp))),
              body: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Yor QR Code",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),
                    Center(
                      child: QrImage(
                        foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
                        data: QrCubit.QrCodeData!,
                        size: myApplication.widthClc(300, context),
                        version: QrVersions.auto,
                      ),
                    ),
                    SizedBox(height: myApplication.hightClc(50, context),),
                    Text(QrCubit.QrCodeData!,style: TextStyle(fontSize: myApplication.widthClc(18, context),
                        fontWeight: FontWeight.w600),),
                    SizedBox(
                      height: myApplication.hightClc(100, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        smallButton(ontap: ()async{
                          showTopSnackBar(Overlay.of(context),
                              const mySnackBar.success(message: "Copyed"));
                          // await Clipboard.setData(ClipboardData(text: QrCubit.capture!.barcodes.first.rawValue));

                        }, text: "Copy", color: myColors.softblu, textcolor: myColors.blu),
                        smallButton(ontap: ()async{
                          await LocalAuthCubit.authenticate(context);
                          if(LocalAuthCubit.authenticated){
                            showTopSnackBar(Overlay.of(context),
                              const mySnackBar.success(message: "Payed Successfully"),
                            );
                            myApplication.navigateToRemove(context, const mainScreen());
                          }

                        }, text: "Pay", color: myColors.blu, textcolor:Colors.white),

                      ],
                    ),

                  ],
                ),
              ),
            )
        )
    );
  }
}
