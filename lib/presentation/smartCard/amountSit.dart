import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/add&send/add_send_cubit.dart';
import 'package:tap_cash/business_logic/smartCards/smart_cards_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/smartCard.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class amountSit extends StatelessWidget {
  amountSit({Key? key}) : super(key: key);




  double amount = 1000;


  saveCreditCard(){
    Map<String,String>creditCard = {
      "cardNumber": "1234567891234567",
    "expiryDate": "14/25",
    "cardHolderName": "Mohamed Refay",
    "cvvCode" : "1233",
    };
    smartCard.creditCards.add(creditCard);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tap Cash daily  card",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Export a card valid for 24 hours",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(16, context),
                      fontWeight: FontWeight.w400),
                ),

                SizedBox(
                  height: myApplication.hightClc(170, context),
                ),

                Text(
                  "Enter an amount for your card",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(18, context),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: myApplication.hightClc(50, context),
                ),



                BlocBuilder<AddSendCubit, AddSendState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(height: myApplication.hightClc(30, context),),
                        Container(
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
                              "EGP: ${amount.toInt().toString()}",
                              style: TextStyle(
                                  fontSize: myApplication.widthClc(24, context),
                                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          height: myApplication.hightClc(48, context),
                        ),
                        SizedBox(height: myApplication.hightClc(30, context),),
                        Slider(
                            divisions: 150,
                            thumbColor: myColors.softblu,
                            min: 0,
                            max: 15000,
                            value: amount,
                            onChanged: (val) {
                              amount = val;
                              BlocProvider.of<AddSendCubit>(context)
                                  .emit(sendFriendAmount());
                            }),
                      ],
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    children: [
                      Spacer(),
                      confirmButton(
                          ontap: () async{
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                    context: context,
                                    builder: (BuildContext context){
                                      return Container(
                                        width: double.infinity,
                                        height: 300,
                                        margin: EdgeInsets.all(myApplication.widthClc(17, context)),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:EdgeInsets.symmetric(horizontal: myApplication.widthClc(50, context)),
                                              child: Column(
                                                children: [
                                                  Text("Confirm !",style: TextStyle(fontSize: myApplication.widthClc(20, context),
                                                  fontWeight: FontWeight.w600),),
                                                  SizedBox(height: myApplication.hightClc(16, context),),
                                                  Text("A daily  card  of  EGP 500 will be export, this card valid for 24 hours",
                                                    style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                                      fontWeight: FontWeight.w400),),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: myApplication.hightClc(32, context),),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: myColors.blu,
                                                ),
                                                height: myApplication.hightClc(55, context),
                                                width: double.infinity,
                                                child: Center(
                                                  child: Text("Export Now",
                                                    style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                                    fontWeight: FontWeight.w600,color: Colors.white),),
                                                ),
                                              ),
                                              onTap: (){
                                                AwesomeDialog(
                                                  width: 400,
                                                  transitionAnimationDuration: Duration(seconds: 1),
                                                  animType: AnimType.bottomSlide,
                                                   dialogType: DialogType.noHeader,
                                                  dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
                                                  body: Container(
                                                    margin: EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context)),
                                                    height: myApplication.hightClc(300, context),
                                                    width: myApplication.widthClc(350, context),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          height: myApplication.hightClc(100, context),
                                                          width: myApplication.widthClc(100, context),
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
                                                        Container(
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
                                                              "2561-2145-8875-4862",
                                                              style: TextStyle(
                                                                  fontSize: myApplication.widthClc(16, context),
                                                                  fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                          height: myApplication.hightClc(48, context),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text("this card valid for 24 hours",
                                                          style: TextStyle(
                                                            fontSize: myApplication.widthClc(14, context),
                                                            fontWeight: FontWeight.w400,
                                                          ),),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        GestureDetector(
                                                          onTap: ()async{
                                                            saveCreditCard();
                                                            await Clipboard.setData(ClipboardData(text: "2561-2145-8875-4862"));
                                                            showTopSnackBar(Overlay.of(context),
                                                            mySnackBar.success(message: "Copied"),
                                                            );
                                                            BlocProvider.of<SmartCardsCubit>(context).emit(SmartCardsShow());
                                                            myApplication.navigateTo(mainScreen(), context);
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                              color: myColors.blu,
                                                            ),
                                                            height: myApplication.hightClc(50, context),
                                                            width: double.infinity,
                                                            child: Center(
                                                              child: Text("Copy Number",
                                                                style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                                                    fontWeight: FontWeight.w600,color: Colors.white),),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                  context: context,
                                                ).show();

                                              },
                                            ),
                                            SizedBox(height: myApplication.hightClc(16, context),),
                                            GestureDetector(
                                              child: Container(
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
                                                height: myApplication.hightClc(55, context),
                                                width: double.infinity,
                                                child: Center(
                                                  child: Text("Cancel",
                                                    style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                                        fontWeight: FontWeight.w600),),
                                                ),
                                              ),
                                              onTap: () => Navigator.pop(context),
                                            ),

                                          ],
                                        ),
                                      );
                                    });
                          },
                          text: "Export Card"),
                      SizedBox(
                        height: myApplication.hightClc(25, context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
