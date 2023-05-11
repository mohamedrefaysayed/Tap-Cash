// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously, file_names

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/donations/donations_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class donationAmount extends StatelessWidget {
  donationAmount({Key? key}) : super(key: key);

  double amount = 100;

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

                    Text(
                      "Donations",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),

                    Hero(
                      tag: "donation",
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/home/donation.png",
                          height: myApplication.hightClc(100, context),
                          width: myApplication.widthClc(100, context),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),

                    const Text(
                      "Select Donation Amount",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    ),

                    BlocBuilder<DonationsCubit, DonationsState>(
                      builder: (context, state) {
                        return Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                                  "EGP: ${amount.toInt().toString()}",
                                  style: TextStyle(
                                      fontSize:
                                          myApplication.widthClc(24, context),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: myApplication.hightClc(30, context),
                            ),

                            Slider(
                                divisions: 20,
                                thumbColor: myColors.softblu,
                                min: 0,
                                max: 1000,
                                value: amount,
                                onChanged: (val) {
                                  amount = val;
                                  BlocProvider.of<DonationsCubit>(context)
                                      .emit(DonationsInitial());
                                }
                                ),
                          ],
                        );
                      },
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
                                      "Donated Successfully",
                                      (_) => myApplication.navigateTo(
                                          const mainScreen(), context)
                                  );
                                }
                              },
                              text: "Donate"),

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
