// ignore_for_file: camel_case_types,, file_names, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class payInternetBill extends StatelessWidget {
  payInternetBill({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  String landNumer = "";

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

                    Hero(

                      tag: "internet",
                      child: Container(
                        height: myApplication.hightClc(122, context),
                        width: myApplication.widthClc(122, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.shade100,
                        ),

                        child: Icon(
                          Icons.wifi,
                          size: myApplication.widthClc(80, context),
                          color: Colors.orange,
                        ),

                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(48, context),
                    ),

                    Text(
                      "Pay internet bill",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),

                    const Text(
                      "Pay internet easily.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(16, context),
                    ),

                    const Text(
                      "You can pay anytime and anywhere!",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    ),

                    Form(

                      key: formkey,

                      child: TextFormField(

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your landline Numer';
                          } else if (value.length != 4) {
                            return 'Enter Valid landline Numer';
                          } else {
                            return null;
                          }
                        },

                        keyboardType: TextInputType.number,

                        style: Theme.of(context).textTheme.bodySmall,

                        onChanged: (val) {
                          landNumer = val;
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
                          labelText: "landline Numer",
                        ),

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

                              text: "Recharge Now"),

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
