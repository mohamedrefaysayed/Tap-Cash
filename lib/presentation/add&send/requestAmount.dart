import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/add&send/add_send_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class requestAmount extends StatelessWidget {
  requestAmount({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

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
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(75)),
                      labelText: "Friend ID",
                    ),
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(50, context),
                ),
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
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(1, 1.5),
                                spreadRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "EGP: ${AddSendCubit.requestAmount.toInt().toString()}",
                              style: TextStyle(
                                  fontSize: myApplication.widthClc(24, context),
                                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          height: myApplication.hightClc(48, context),
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
                Expanded(
                  child: Column(
                    children: [
                      Spacer(),
                      confirmButton(
                          ontap: () async{
                            if (formkey.currentState!.validate()) {
                              await LocalAuthCubit.authenticate(context);
                              if(LocalAuthCubit.authenticated){
                                myApplication.doneDialog(context,"Amount requested successfully",(_) => myApplication.navigateTo(mainScreen(), context));
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
