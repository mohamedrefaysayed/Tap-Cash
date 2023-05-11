// ignore_for_file: file_names, camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_visible_for_testing_member, duplicate_ignore, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/addMonyAmount/add_mony_amount_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/criditCard.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class addMonyAmount extends StatelessWidget {

  final int index;

   const addMonyAmount({Key? key, required this.index}) : super(key: key);


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

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Add Money",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),

                myApplication.creditCard(creditCardMap.creditCard[index]["cardNumber"]!,
                  creditCardMap.creditCard[index]["expiryDate"]!,
                  creditCardMap.creditCard[index]["cardHolderName"]!,
                  creditCardMap.creditCard[index]["cvvCode"]!,true
                ),

                SizedBox(
                  height: myApplication.hightClc(100, context),
                ),

                BlocBuilder<AddMonyAmountCubit, AddMonyAmountState>(

                  builder: (context, state) {

                    return Column(

                      children: [

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
                              "EGP: ${AddMonyAmountCubit.amount.toInt().toString()}",
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
                            divisions: 150,
                            thumbColor: myColors.softblu,
                            min: 0,
                            max: 15000,
                            value: AddMonyAmountCubit.amount,
                            onChanged: (val) {
                              AddMonyAmountCubit.amount = val;
                              BlocProvider.of<AddMonyAmountCubit>(context)
                                  .emit(AddMonyAmountInitial());
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
                                  "Added successfully",
                                  (_) => myApplication.navigateTo(
                                      const mainScreen(), context));
                            }
                          },

                          text: "Add"),

                      SizedBox(
                        height: myApplication.hightClc(25, context),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        )
    );
  }
}
