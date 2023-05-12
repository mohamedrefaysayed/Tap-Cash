// ignore_for_file: camel_case_types, duplicate_ignore, file_names, must_be_immutable

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/billRemeinderMap.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/more/billReminder/reminders.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class billReminder extends StatelessWidget {
  billReminder({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  String title = "";
  String amount = "";
  String date = "";
  String time = "";


  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () => myApplication.keyboardFocus(context),

      child: Scaffold(

        appBar: AppBar(leading: myApplication.backIcon(context, () {})),

        body: Container(

          margin: const EdgeInsets.all(20),

          child: ListView(

            children: [

              const Text(
                "Group Payment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              SizedBox(
                height: myApplication.hightClc(100, context),
              ),

              Form(
                key: formkey,
                child: Column(
                  children: [

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Title';
                        } else if (value.length < 5) {
                          return 'Enter a valid Title';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      onChanged: (val) {
                        title = val;
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
                        labelText: "Title",
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(35, context),
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Amount';
                        }else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      onChanged: (val) {
                        amount = val;
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
                        labelText: "Amount",
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(35, context),
                    ),

                    TextFormField(

                      validator: (value) {

                        if (value!.isEmpty) {
                          return 'Enter Date';
                        } else {
                          return null;
                        }

                      },

                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      onChanged: (val) {
                        date = val;
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
                        labelText: "Date",
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(35, context),
                    ),

                    TextFormField(

                      validator: (value) {

                        if (value!.isEmpty) {
                          return 'Enter Time';
                        } else {
                          return null;
                        }

                      },

                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      onChanged: (val) {
                        time = val;
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
                        labelText: "Time",
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(35, context),
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: myApplication.hightClc(100, context),
              ),

              BlocConsumer<InfoCubit, InfoState>(

                listener: (context, state) {

                  if (state is InfoSuccess) {

                    showTopSnackBar(Overlay.of(context),
                        const mySnackBar.success(message: "Saved Successfully"));

                  }
                },

                builder: (context, state) {

                  if (state is InfoLoading) {

                    return const Center(

                      child: CircularProgressIndicator(
                        color: myColors.blu,
                      ),

                    );
                  } else {

                    return confirmButton(

                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            reminder.billReminderMap.add(
                              {
                                "title": title,
                                "amount": amount,
                                "date": date,
                                "time": time,
                              }
                            );
                          }
                          myApplication.navigateToReplace(context,showReminders());

                        },
                        text: "Sit");
                  }
                },
              ),

              SizedBox(
                height: myApplication.hightClc(63, context),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
