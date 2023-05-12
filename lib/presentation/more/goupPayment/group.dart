// ignore_for_file: camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/groupPayment/group_payment_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/groupPaymentMap.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class group extends StatelessWidget {
  const group({Key? key, required this.mainIndex}) : super(key: key);

  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        GroupPaymentCubit.amount =300;
        return Future.value(true);
      },
      child: GestureDetector(

          onTap: () => myApplication.keyboardFocus(context),

          child: Scaffold(

            resizeToAvoidBottomInset: false,

            appBar: AppBar(leading: myApplication.backIcon(context, () {})),

            body: Container(

              margin: const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Align(

                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Group Payment",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: myApplication.hightClc(30, context),),

                  Container(

                    width: double.infinity,
                    height: myApplication.hightClc(60, context),

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

                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),

                      child: GestureDetector(

                        onTap: (){
                          showModalBottomSheet(

                              context: context,
                              builder: (BuildContext context){

                                return Container(
                                  height: myApplication.hightClc(250, context),
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [

                                      SizedBox(height: myApplication.hightClc(10, context),
                                      ),

                                      Text("Description",
                                        style: TextStyle(fontSize: myApplication.widthClc(20,
                                            context),fontWeight: FontWeight.w700),
                                      ),

                                      SizedBox(height: myApplication.hightClc(20, context),),

                                      Text(groupPayment.group[mainIndex]["description"],
                                        style: TextStyle(fontSize: myApplication.widthClc(20, context),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },

                        child: Row(
                          children: [
                            Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text(groupPayment.group[mainIndex]["groupName"],style: TextStyle(fontWeight: FontWeight.w700,
                                    fontSize: myApplication.widthClc(24, context)),
                                ),

                                Text("you and ${groupPayment.group[mainIndex]["membersNumber"]-1} others",style: TextStyle(fontWeight: FontWeight.w400,
                                    fontSize: myApplication.widthClc(12, context),color: Colors.grey),),

                              ],
                            ),

                            const Spacer(),

                            GestureDetector(

                                onTap: (){

                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      context: context,
                                      builder: (BuildContext context){

                                        return SizedBox(

                                          height: myApplication.hightClc(380, context),
                                          width: double.infinity,

                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20)
                                            ),

                                            margin: const EdgeInsets.symmetric(horizontal: 42,vertical: 10),

                                            child: SizedBox(

                                              height: myApplication.hightClc(450, context),

                                              child: ListView(

                                                shrinkWrap: true,

                                                children: [

                                                  SizedBox(height: myApplication.hightClc(10, context),),

                                                  Center(
                                                    child: Text("Friends",style: TextStyle(fontSize: myApplication.widthClc(18, context),
                                                      fontWeight: FontWeight.w600,
                                                    ),),
                                                  ),

                                                  SizedBox(height: myApplication.hightClc(20, context),),

                                            Container(
                                              margin: EdgeInsets.symmetric(vertical: myApplication.hightClc(10, context),
                                              horizontal: myApplication.widthClc(10, context)),
                                              child: Center(
                                                child: Text(
                                                  "              You \n\n ${groupPayment.group[mainIndex]["membersNames"]}",
                                                  style: TextStyle(fontSize: myApplication.widthClc(18, context),
                                                  fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                            ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        );

                                      });
                                },

                                child: Icon(Icons.list,color: myColors.blu,size: myApplication.widthClc(40, context),))
                          ],
                        ),
                      ),
                    ),

                  ),

                  SizedBox(height: myApplication.hightClc(100, context),),

                  BlocBuilder<GroupPaymentCubit, GroupPaymentState>(

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
                                "EGP: ${GroupPaymentCubit.amount.toInt().toString()}",
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
                              value: GroupPaymentCubit.amount,
                              onChanged: (val) {
                                GroupPaymentCubit.amount = val;
                                BlocProvider.of<GroupPaymentCubit>(context)
                                    .emit(GroupPaymentInitial());
                              }),

                          SizedBox(height: myApplication.hightClc(150, context),),

                          confirmButton(ontap: ()async{

                            await LocalAuthCubit.authenticate(context);
                            if(LocalAuthCubit.authenticated){
                              myApplication.doneDialog(context, "Payed Successfully", (_){
                                myApplication.navigateTo(const mainScreen(), context);
                              });
                            }

                          }, text: "Pay")

                        ],
                      );
                    },
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
