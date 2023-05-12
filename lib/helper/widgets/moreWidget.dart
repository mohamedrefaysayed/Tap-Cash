import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';

class moreWiget extends StatelessWidget {
  const moreWiget({Key? key, required this.text, required this.color, required this.ontap}) : super(key: key);

  final String text;
  final Color color;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),

        child: Container(
            height: myApplication.hightClc(65, context),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
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
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Align(alignment: Alignment.centerLeft,child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: color),)),
            )
        ),
      ),
    );
  }
}
