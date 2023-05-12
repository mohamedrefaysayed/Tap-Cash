// ignore_for_file: camel_case_types, file_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/groupPayment/group_payment_cubit.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/data/creat_PIN.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class groupDataFill extends StatelessWidget {
  groupDataFill({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  String groupName = "";
  String IdNumbers = "";

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
                height: myApplication.hightClc(50, context),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Group Name';
                        } else if (value.length < 5) {
                          return 'Enter a valid Group Name';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      onChanged: (val) {
                        groupName = val;
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
                        labelText: "Group Name",
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(25, context),
                    ),
                    Container(
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
                              if (GroupPaymentCubit.counter > 2) {
                                GroupPaymentCubit.counter--;
                                BlocProvider.of<GroupPaymentCubit>(context)
                                    .emit(GroupPaymentCounter());
                              }
                            },
                            child: Container(
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
                          BlocBuilder<GroupPaymentCubit, GroupPaymentState>(
                            builder: (context, state) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  GroupPaymentCubit.counter.toString(),
                                  style: TextStyle(
                                      fontSize:
                                          myApplication.widthClc(24, context),
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              if (GroupPaymentCubit.counter < 10) {
                                GroupPaymentCubit.counter++;
                                BlocProvider.of<GroupPaymentCubit>(context)
                                    .emit(GroupPaymentCounter());
                              }
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
                    ),
                    SizedBox(
                      height: myApplication.hightClc(25, context),
                    ),
                    BlocBuilder<GroupPaymentCubit, GroupPaymentState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: myApplication.hightClc(300, context),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: GroupPaymentCubit.counter-1,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter ${index+1} Id Number';
                                      } else if (value.length < 5) {
                                        return 'Enter a valid Id Number';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.name,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    onChanged: (val) {
                                      InfoCubit.nickName = val;
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
                                          borderRadius:
                                              BorderRadius.circular(75)),
                                      labelText: "${index+1} Id Number",
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    )
                  ],
                ),
              ),

              SizedBox(
                height: myApplication.hightClc(50, context),
              ),

              BlocConsumer<InfoCubit, InfoState>(
                listener: (context, state) {
                  if (state is InfoSuccess) {
                    showTopSnackBar(Overlay.of(context),
                        const mySnackBar.success(message: "Saved Successfully"));
                    myApplication.navigateTo(const creatPIN(), context);
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

                          // groupPayment.group.add({
                          //   "membersNumber": GroupPaymentCubit.counter,
                          //   "groupName":groupName,
                          //   "membersNames": "ahmed Hussen \n\n mohamed Saad \n\n yassmeen Ghazy",
                          //   "groupIds":IdNumbers,
                          // });

                          if (formkey.currentState!.validate()) {
                            myApplication.doneDialog(context,
                                "Created Successflully", (_){
                                  myApplication.navigateToRemove(context,const mainScreen());
                                });
                          }
                        },
                        text: "Continue");
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
