// ignore_for_file: invalid_use_of_visible_for_testing_member, use_build_context_synchronously, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/add&send/add_send_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

// ignore: camel_case_types
class requestAmount extends StatelessWidget {
  requestAmount({Key? key}) : super(key: key);


  //formKey (Make Valdation)
  final formkey = GlobalKey<FormState>();

  //NID for Friend To Request Money
  String friendID = "";

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

          //ApBar
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),

          //Body
          body: Container(

            margin: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //ScreenTitle
                Text(
                  "Enter Your Friend ID Number",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "And Select Amount",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: myApplication.hightClc(170, context),
                ),

                // Id Text Field
                Form(

                  key: formkey,

                  child: TextFormField(

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Friend ID Number';
                      } else if (value.length != 14) {
                        return 'Enter Valid ID Number';
                      } else {
                        return null;
                      }
                    },

                    keyboardType: TextInputType.visiblePassword,

                    style: Theme.of(context).textTheme.bodySmall,

                    onChanged: (val) {
                      friendID = val;
                    },

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(75),
                        borderSide: BorderSide(
                          color: myColors.blu.withOpacity(0.3),
                          width: 2,
                        ),
                      ),

                      contentPadding:
                      EdgeInsets.symmetric(
                          horizontal: myApplication.widthClc(30, context),
                          vertical: myApplication.hightClc(15, context)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(75)),
                      labelText: "Friend ID",
                    ),

                  ),
                ),

                SizedBox(
                  height: myApplication.hightClc(50, context),
                ),

                //Slider To Select Amount
                BlocBuilder<AddSendCubit, AddSendState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(height: myApplication.hightClc(30, context),),
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
                              "EGP: ${AddSendCubit.requestAmount.toInt().toString()}",
                              style: TextStyle(
                                  fontSize: myApplication.widthClc(24, context),
                                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        SizedBox(height: myApplication.hightClc(30, context),),
                        Slider(
                            divisions: 150,
                            thumbColor: myColors.softblu,
                            min: 0,
                            max: 15000,
                            value: AddSendCubit.requestAmount,
                            onChanged: (val) {
                              AddSendCubit.requestAmount = val;
                              BlocProvider.of<AddSendCubit>(context)
                                  .emit(RequestFriendAmount());
                            }),
                      ],
                    );
                  },
                ),

                //Confrimation Button
                Expanded(
                  child: Column(
                    children: [

                      const Spacer(),

                      confirmButton(

                          ontap: () async{
                            if (formkey.currentState!.validate()) {
                              await LocalAuthCubit.authenticate(context);
                              if(LocalAuthCubit.authenticated){
                                myApplication.doneDialog(
                                    context,
                                    "Amount requested successfully",
                                        (_) => myApplication.navigateTo(const mainScreen(), context));
                              }
                            }
                          },
                          text: "Continue"),
                      SizedBox(
                        height: myApplication.hightClc(25, context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
