import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/moreWidget.dart';
import 'package:tap_cash/presentation/more/cashBack.dart';

class moreMain extends StatelessWidget {
  moreMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(

        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Container(
              height: myApplication.hightClc(650, context),
              child: ListView(
                shrinkWrap: true,
                children: [
                  moreWiget(text: "Gifts",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){},),
                  moreWiget(text: "Cash Back",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){myApplication.navigateTo(cashBack(), context);}),
                  moreWiget(text: "Requests",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Group Payment",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Friends",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Bill Reminder",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  moreWiget(text: "Privacy Policy",color: Theme.of(context).textTheme.bodyMedium!.color!,ontap: (){}),
                  SizedBox(height: myApplication.hightClc(10, context),),
                  GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      height: myApplication.hightClc(81, context),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(1, 1.5),
                            spreadRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.signOut,color: Colors.red,),
                            SizedBox(width: myApplication.widthClc(37, context),),
                            Align(alignment: Alignment.centerLeft,child: Text("Logout",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red),)),
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
