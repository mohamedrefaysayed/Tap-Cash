// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/groupPaymentMap.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/more/goupPayment/group.dart';
import 'package:tap_cash/presentation/more/goupPayment/groupDataFill.dart';

class groups extends StatelessWidget {
  const groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => myApplication.keyboardFocus(context),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Group Payment",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: myApplication.hightClc(30, context),),
                groupPayment.group.isEmpty
                ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: myApplication.hightClc(150, context),),
                      Text("There are no groups yet",
                        style: TextStyle(fontSize: myApplication.widthClc(24, context),
                            fontWeight: FontWeight.w700),),

                      const Spacer(),

                      confirmButton(ontap: (){}, text: "Create Group"),
                      SizedBox(height: myApplication.hightClc(30, context),),

                    ],
                  ),
                )
                : SizedBox(
                  height: myApplication.hightClc(600, context),
                  child: ListView.builder(
                    itemCount: groupPayment.group.length,
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          myApplication.navigateTo(group(mainIndex: index,), context);
                        },
                        child: Container(
                          height: myApplication.hightClc(60, context),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: myApplication.widthClc(20, context),vertical: myApplication.hightClc(10, context)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(groupPayment.group[index]["groupName"],style: TextStyle(fontWeight: FontWeight.w700,
                              fontSize: myApplication.widthClc(24, context)),),
                              Text("you and ${groupPayment.group[index]["membersNumber"]-1} others",style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: myApplication.widthClc(14, context),color: Colors.grey),),
                            ],
                          ),
                        ),
                      );
                      }
                  ),
                ),
                  const Spacer(),
                  Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => myApplication.navigateTo(groupDataFill(), context),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/bottomNavFloat/bottomNavBg.png",height: 70,width: 70,),
                          Icon(Icons.add,color: Colors.white,size: myApplication.widthClc(30, context),)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
