import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/myColors.dart';
import 'package:tap_cash/helper/widgets/intrest_Box.dart';
import 'package:tap_cash/helper/widgets/small_Button.dart';
import 'package:tap_cash/presentation/main_Screen/info_Fill.dart';

class interstScreen extends StatelessWidget {
  const interstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Why Using Tap Cash ?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: myApplication.hightClc(24, context),
                ),
                Text(
                    "we want to know what is your interests \n and to provide the best experience ",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: myApplication.hightClc(100, context),
                ),
                Expanded(
                  child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return intrestBox(
                              title: "Flutter Developer",
                              index: index,
                            );
                          })
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallButton(
                      ontap: () {myApplication.navigateTo(infoFill(), context);},
                      text: "Skip",
                      color: myColors.softblu,
                      textcolor: myColors.blu,
                    ),
                    smallButton(
                      ontap: () {myApplication.navigateTo(infoFill(), context);},
                      text: "Next",
                      color: myColors.blu,
                      textcolor: Theme.of(context).textTheme.labelSmall!.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}