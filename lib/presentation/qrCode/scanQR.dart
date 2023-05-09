import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tap_cash/business_logic/QR/qr_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/small_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class scanQr extends StatelessWidget {
  scanQr({Key? key}) : super(key: key);

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
                      icon: Icon(Icons.arrow_back_ios_new_sharp))),
              body: Container(
                margin: EdgeInsets.all(20),
                child: BlocBuilder<QrCubit, QrState>(
                  builder: (context, state) {
                    if(state is QrResult){
                      return Column(
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
                              data: QrCubit.capture!.barcodes.first.rawValue!,
                              size: 300,
                              version: QrVersions.auto,
                            ),
                          ),
                          SizedBox(height: myApplication.hightClc(50, context),),
                          Text(QrCubit.capture!.barcodes.first.rawValue!,style: TextStyle(fontSize: myApplication.widthClc(18, context),
                          fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: myApplication.hightClc(100, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              smallButton(ontap: ()async{
                                showTopSnackBar(Overlay.of(context),
                                    mySnackBar.success(message: "Copyed"));
                                await Clipboard.setData(ClipboardData(text: QrCubit.capture!.barcodes.first.rawValue));

                              }, text: "Copy", color: myColors.softblu, textcolor: myColors.blu),
                              smallButton(ontap: ()async{
                                await LocalAuthCubit.authenticate(context);
                                if(LocalAuthCubit.authenticated){
                                  showTopSnackBar(Overlay.of(context),
                                  mySnackBar.success(message: "Payed Successfully"),
                                  );
                                  myApplication.navigateToRemove(context, mainScreen());
                                }

                              }, text: "Pay", color: myColors.blu, textcolor:Colors.white),

                            ],
                          ),

                        ],
                      );
                    }else{
                      return Column(
                        children: [
                          Text(
                            "Scan QR Code",
                            style: TextStyle(
                                fontSize: myApplication.widthClc(24, context),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: myApplication.hightClc(10, context),
                          ),

                          Text(
                            "Please point the camera at the QR code",
                            style: TextStyle(
                                fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w400),
                          ),

                          SizedBox(
                            height: myApplication.hightClc(100, context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(1, 1.5),
                                  spreadRadius: 10,
                                )
                              ],
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(75),
                            ),
                              height: myApplication.hightClc(450, context),
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle
                                      ),
                                      height: myApplication.hightClc(350, context),
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: MobileScanner(
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, child) {
                                          return Container();
                                        },
                                        onDetect: (capture) {
                                            QrCubit.capture = capture;
                                            BlocProvider.of<QrCubit>(context).emit(QrResult());
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(80),
                                    child: Center(
                                      child: Image.asset("assets/images/scanRec.png"),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            )
        )
    );
  }
}
