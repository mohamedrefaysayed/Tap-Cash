// ignore_for_file: camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/business_logic/onlinePayment/online_payment_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/counterWiget.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class onlinePayment extends StatelessWidget {
  onlinePayment({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();


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

              body: Container(

                margin: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text(
                                "Online Payment",
                                style: TextStyle(
                                    fontSize: myApplication.widthClc(24, context),
                                    fontWeight: FontWeight.bold),
                              ),

                              SizedBox(
                                height: myApplication.hightClc(20, context),
                              ),

                              const Text(
                                "Shopping easily.",
                                style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              ),

                              SizedBox(
                                height: myApplication.hightClc(10, context),
                              ),

                              const Text(
                                "You can pay anytime and anywhere!",
                                style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              ),

                            ],
                          ),

                          const Spacer(),

                          const Hero(

                            tag: "shopping",
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.monetization_on_outlined,
                                color: myColors.blu,
                                size: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(80, context),
                    ),

                    Form(

                      key: formkey,

                      child: Column(
                        children: [
                          TextFormField(

                            validator: (value) {

                              if (value!.isEmpty) {
                                return 'Enter item Numer';
                              } else {
                                return null;
                              }

                            },

                            keyboardType: TextInputType.text,
                            style: Theme.of(context).textTheme.bodySmall,

                            onChanged: (val) {
                              OnlinePaymentCubit.itemName = val;
                            },

                            decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(75),
                                borderSide: BorderSide(
                                  color: myColors.blu.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),

                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(75)
                              ),

                              labelText: "Item Name",
                            ),
                          ),

                          SizedBox(height: myApplication.hightClc(30, context),),

                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter item Code';
                              } else {
                                return null;
                              }
                            },

                            keyboardType: TextInputType.number,

                            style: Theme.of(context).textTheme.bodySmall,

                            onChanged: (val) {
                              OnlinePaymentCubit.itemName = val;
                            },

                            decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(75),

                                borderSide: BorderSide(
                                  color: myColors.blu.withOpacity(0.3),
                                  width: 2,
                                ),

                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(75)),
                              labelText: "Item Code",
                            ),
                          ),

                          SizedBox(height: myApplication.hightClc(50, context),),

                          BlocBuilder<OnlinePaymentCubit, OnlinePaymentState>(
                            builder: (context, state) {
                              return Column(

                                children: [

                                  const counterWidget(),

                                  SizedBox(height: myApplication.hightClc(50, context),),

                                  Container(
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
                                    height: myApplication.hightClc(48, context),
                                    child: Center(

                                      child: Text(
                                        "EGP: ${OnlinePaymentCubit.amount.toInt().toString()}",
                                        style: TextStyle(
                                            fontSize: myApplication.widthClc(24, context),
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),

                                    ),
                                  ),

                                  SizedBox(
                                    height: myApplication.hightClc(30, context),
                                  ),

                                  Slider(
                                      divisions: 200,
                                      thumbColor: myColors.softblu,
                                      min: 0,
                                      max: 10000,
                                      value: OnlinePaymentCubit.amount,
                                      onChanged: (val) {
                                        OnlinePaymentCubit.amount = val;
                                        BlocProvider.of<OnlinePaymentCubit>(context)
                                            .emit(OnlinePaymentInitial());
                                      }),
                                ],
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                    Expanded(

                      child: Column(

                        children: [

                          const Spacer(),

                          confirmButton(
                              ontap: () async {
                                await LocalAuthCubit.authenticate(context);
                                if (LocalAuthCubit.authenticated) {
                                  myApplication.doneDialog(
                                      context,
                                      "Recharged Successfully",
                                          (_) => myApplication.navigateTo(
                                          const mainScreen(), context));
                                }
                              },
                              text: "Pay"),

                          SizedBox(
                            height: myApplication.hightClc(25, context),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
