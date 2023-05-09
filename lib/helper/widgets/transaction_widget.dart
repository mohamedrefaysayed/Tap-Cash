import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'dart:math' as math;

class transactionWidget extends StatelessWidget {
  const transactionWidget(
      {Key? key,
      required this.color,
      required this.name,
      required this.icon,
      required this.date,
      required this.amount,
      required this.inWallet})
      : super(key: key);

  final Color color;
  final String name;
  final IconData icon;
  final String date;
  final String amount;
  final bool inWallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 41,
                width: 41,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.2),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
              ),
              SizedBox(
                width: myApplication.widthClc(10, context),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                    child: SizedBox(
                      width: 70,
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: myApplication.hightClc(10, context),
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      date,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  "EGP $amount",overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: myApplication.widthClc(10, context),
              ),
              inWallet
                  ? Transform.rotate(
                      angle: 135 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_right_alt,
                        size: 35,
                        color: Colors.green,
                      ))
                  : Transform.rotate(
                      angle: -45 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_right_alt,
                        size: 35,
                        color: Colors.red,
                      )),
            ],
          )
        ],
      ),
    );
  }
}
