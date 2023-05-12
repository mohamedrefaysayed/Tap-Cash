// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/billRemeinderMap.dart';
import 'package:tap_cash/presentation/more/billReminder/billReminder.dart';

class showReminders extends StatelessWidget {
  showReminders({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () => myApplication.keyboardFocus(context),

      child: Scaffold(

        appBar: AppBar(leading: myApplication.backIcon(context, () {})),

        body: Column(

          children: [

            Container(

              margin: const EdgeInsets.all(20),
              child: reminder.billReminderMap.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                itemCount: reminder.billReminderMap.length,
                  itemBuilder: (context,index){

                  return Container(

                    margin: const EdgeInsets.symmetric(vertical: 10),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(reminder.billReminderMap[index]["title"]!,
                        style: TextStyle(fontSize: myApplication.widthClc(18, context),
                        fontWeight: FontWeight.w600),
                          ),

                        SizedBox(height: myApplication.hightClc(20, context),
                        ),

                        Container(

                          height: myApplication.hightClc(55, context),
                          width: double.infinity,

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: myColors.shadow,
                                blurRadius: 10,
                                offset: const Offset(1, 1.5),
                                spreadRadius: 10,
                              )

                            ],

                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),

                          child: Container(

                              margin: const EdgeInsets.symmetric(horizontal: 10),

                              child: Row(

                                children: [

                                  Text(reminder.billReminderMap[index]["date"]!,
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: myApplication.widthClc(12, context),
                                    color: Colors.grey),
                                  ),

                                  const Spacer(),

                                  Text(reminder.billReminderMap[index]["time"]!,
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: myApplication.widthClc(12, context),
                                        color: Colors.grey),
                                  ),

                                ],
                              ),
                          ),
                        ),
                      ],
                    ),
                  );

                  }
              )
                  : Column(
                    children: [
                      SizedBox(height: myApplication.hightClc(250, context),),

                      Center(
                child: Text("No Reminders , Create One",style: TextStyle(fontSize: myApplication.widthClc(24, context),
                fontWeight: FontWeight.w700),
                ),
              ),
                    ],
                  ),
            ),

            const Spacer(),

            Padding(

              padding: const EdgeInsets.only(right: 20,bottom: 20),

              child: Align(

                alignment: Alignment.centerRight,

                child: GestureDetector(

                  onTap: () => myApplication.navigateToReplace(context,billReminder()),

                  child: Stack(

                    alignment: Alignment.center,

                    children: [

                      Image.asset("assets/bottomNavFloat/bottomNavBg.png",
                        height: myApplication.hightClc(70, context),
                        width: myApplication.widthClc(70, context),),

                      Icon(Icons.add,color: Colors.white,size: myApplication.widthClc(30, context),)

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
