import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/add&send/add_send_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:tap_cash/presentation/smartCard/amountSit.dart';
import 'package:tap_cash/presentation/smartCard/smartCards.dart';

class exportsCard extends StatelessWidget {
  exportsCard({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  String friendID = "";

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
                  "Online Payment Card",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: myApplication.hightClc(100, context),
                ),

                Container(
                  height: myApplication.hightClc(207, context),
                  width: myApplication.widthClc(396, context),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text("Export a new tap cash  card ",
                            style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w600),),
                        margin: EdgeInsets.only(left: myApplication.widthClc(15, context)),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Image.asset("assets/home/balance_bg.png",
                              width: myApplication.widthClc(370, context),
                            height: myApplication.hightClc(170, context),),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: myApplication.hightClc(15, context),),
                                    Text("Daily Card",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                    fontWeight: FontWeight.w600,color: Colors.white,
                                    ),),
                                    SizedBox(height: myApplication.hightClc(5, context),),
                                    Text("Export a card valid for 24 hours",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                      fontWeight: FontWeight.w600,color: Colors.white,
                                    ),),
                                    SizedBox(height: myApplication.hightClc(10, context),),
                                    GestureDetector(
                                      onTap: ()async{
                                        await LocalAuthCubit.authenticate(context);
                                        if(LocalAuthCubit.authenticated){
                                          myApplication.navigateTo(amountSit(), context);
                                        }
                                      },
                                      child: Container(
                                        height: myApplication.hightClc(48, context),
                                        width: myApplication.widthClc(278, context),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.circular(75),
                                        ),
                                        child: Center(
                                          child: Text("Export Card",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                              fontWeight: FontWeight.w400,
                                          color: myColors.blu),),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: myApplication.hightClc(100, context),),

                GestureDetector(
                  onTap: ()async{
                    await LocalAuthCubit.authenticate(context);
                    if(LocalAuthCubit.authenticated){
                      myApplication.navigateTo(smartCards(), context);
                    }

                  },

                  child: Container(
                    height: myApplication.hightClc(78, context),
                    width: myApplication.widthClc(396, context),
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
                    child: Container(
                      margin: EdgeInsets.all(29),
                      child: Row(
                        children: [
                          Text("View all active cards",style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: myApplication.widthClc(16, context)),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: myColors.blu,size: 20,),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}