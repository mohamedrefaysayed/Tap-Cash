// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/transactionsWiget.dart';

class notifications extends StatelessWidget {
  const notifications({Key? key}) : super(key: key);


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
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context)),
                  child: Text(
                    "Notifactions",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
                SizedBox(
                  height: myApplication.hightClc(700, context),
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context,index){
                        return const Center(
                          child: notificationsWidget(),
                        );
                      }
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
