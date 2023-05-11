 // ignore_for_file: file_names, camel_case_types

 import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/intrest_Box.dart';
import 'package:tap_cash/helper/widgets/small_Button.dart';
import 'package:tap_cash/presentation/data/info_Fill.dart';

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

            margin: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  "Why Using Tap Cash ?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),

                SizedBox(
                  height: myApplication.hightClc(24, context),
                ),

                const Text(
                    "we want to know what is your interests \n and to provide the best experience ",
                    style: TextStyle(fontSize: 14)
                ),

                SizedBox(
                  height: myApplication.hightClc(100, context),
                ),

                Expanded(

                  child: ListView(

                    children: const [

                    intrestBox(
                    title: "Spend or save  DAILY",
                    index: 0,
                  ),

                      intrestBox(
                        title: "Send and manage money",
                        index: 1,
                      ),

                      intrestBox(
                        title: "Spend while traveling ",
                        index: 2,
                      ),

                      intrestBox(
                        title: "Others",
                        index: 3,
                      ),

                    ],
                          )
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
                      textcolor: Colors.white,
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
