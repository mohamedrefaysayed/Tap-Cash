// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/moreWidget.dart';
import 'package:tap_cash/presentation/more/billReminder/reminders.dart';
import 'package:tap_cash/presentation/more/cashBack.dart';
import 'package:tap_cash/presentation/more/goupPayment/groups.dart';
import 'package:tap_cash/presentation/more/privacyPolicy.dart';

class moreMain extends StatelessWidget {
  const moreMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(

        margin:  EdgeInsets.symmetric(vertical: myApplication.hightClc(50, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "More",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(30, context),
            ),
            SizedBox(
              height: myApplication.hightClc(650, context),
              child: Column(
                children: [
                  moreWiget(text: "Gifts",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){},),
                  moreWiget(text: "Cash Back",color: Theme.of(context).textTheme.bodyMedium!.color!,
                      ontap: (){myApplication.navigateTo(cashBack(), context);}),
                  moreWiget(text: "Requests",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Group Payment",color: Theme.of(context).textTheme.bodyMedium!.color!,
                      ontap: (){myApplication.navigateTo(const groups(), context);}),
                  moreWiget(text: "Friends",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Bill Reminder",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){
                    myApplication.navigateTo(showReminders(), context);
                  }),
                  moreWiget(text: "Privacy Policy",color: Theme.of(context).textTheme.bodyMedium!.color!,
                      ontap: (){myApplication.navigateTo(const privacyPolicy(), context);}),

                  SizedBox(height: myApplication.hightClc(10, context),),

                  GestureDetector(
                onTap: (){
                  myApplication.confirmDialog(context, "Are You Sure ?", "Log Out", Colors.red, (){
                    BlocProvider.of<SignUpCubit>(context).logout(context);
                  });
                },
                child: Container(
                  margin:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context)),
                  child: Container(
                      height: myApplication.hightClc(60, context),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: myColors.shadow,
                            blurRadius: 10,
                            offset: const Offset(1, 1.5),
                            spreadRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(32, context)),
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.signOut,color: Colors.red,),
                            SizedBox(width: myApplication.widthClc(37, context),),
                            const Align(alignment: Alignment.centerLeft,child: Text("Logout",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red),)),
                          ],
                        ),
                      )
                  ),
                ),
              ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
