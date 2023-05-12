// ignore_for_file: file_names, camel_case_types, invalid_use_of_visible_for_testing_member, must_be_immutable, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/business_logic/smartCards/smart_cards_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/smartCard.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/smartCard/amountSit.dart';

class smartCards extends StatelessWidget {
  smartCards({Key? key}) : super(key: key);


  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;


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
          body: BlocConsumer<SmartCardsCubit, SmartCardsState>(
            listener: (context, state) {
             if(state is SmartCardsInitial){
               if(smartCard.creditCards.isEmpty){
                 BlocProvider.of<SmartCardsCubit>(context).emit(SmartCardsEmpty());
               }else{
                 BlocProvider.of<SmartCardsCubit>(context).emit(SmartCardsShow());
               }
             }
            },
            builder: (context, state) {
              if(state is SmartCardsShow){
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smart Cards",
                        style: TextStyle(
                            fontSize: myApplication.widthClc(24, context),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: myApplication.hightClc(50, context),
                      ),
                      Container(
                        height: myApplication.hightClc(600, context),
                        width: myApplication.widthClc(396, context),
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: smartCard.creditCards.length,
                            itemBuilder: (context,index){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(

                                    child: myApplication.creditCard(
                                        smartCard.creditCards[index]["cardNumber"],
                                        smartCard.creditCards[index]["expiryDate"],
                                        smartCard.creditCards[index]["cardHolderName"],
                                        smartCard.creditCards[index]["cvvCode"],
                                        false
                                    ),

                                  ),
                                  SizedBox(height: myApplication.hightClc(30, context),),
                                ],
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: myApplication.hightClc(200, context),),
                    Text("You don’t have Any active card",style: TextStyle(fontSize: myApplication.widthClc(22, context),fontWeight: FontWeight.w600),),
                    SizedBox(height: myApplication.hightClc(200, context),),
                    SizedBox(
                      width: 200,
                      child: confirmButton(
                        ontap: () async {
                          await LocalAuthCubit.authenticate(context);
                          if(LocalAuthCubit.authenticated){
                            myApplication.navigateTo(amountSit(), context);
                          }
                        },
                        text: "Create Card",
                      ),
                    ),

                  ],
                ),
              );

            },
          ),
        ),
      ),
    );
  }
}
