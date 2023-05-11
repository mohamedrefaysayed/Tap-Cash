import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/onlinePayment/online_payment_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';

class counterWidget extends StatelessWidget {
  const counterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: myApplication.hightClc(60, context),
      width: myApplication.widthClc(250, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(75),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              OnlinePaymentCubit.counter--;
              BlocProvider.of<OnlinePaymentCubit>(context).emit(OnlinePaymentInitial());
            },            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                size: myApplication.widthClc(30, context),
                color: myColors.blu,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              OnlinePaymentCubit.counter.toString(),
              style: TextStyle(
                  fontSize: myApplication.widthClc(24, context),
                  fontWeight: FontWeight.w600),
            ),
          ),
          GestureDetector(
            onTap: () {
              OnlinePaymentCubit.counter++;
              BlocProvider.of<OnlinePaymentCubit>(context).emit(OnlinePaymentInitial());
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: myApplication.widthClc(30, context),
                color: myColors.blu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
