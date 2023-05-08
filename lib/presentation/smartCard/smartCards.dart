import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/business_logic/smartCards/smart_cards_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/data_Maps/smartCard.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/credit_Card/myCreditCard.dart';
import 'package:tap_cash/presentation/smartCard/amountSit.dart';

class smartCards extends StatelessWidget {
  smartCards({Key? key}) : super(key: key);


  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;


  credit(index){
    return myCreditCardWidget(
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'halter',
        fontSize: 12,
        package: 'flutter_credit_card',
      ),
      glassmorphismConfig:
      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
      cardNumber: smartCard.creditCards[index]["cardNumber"]!,
      expiryDate: smartCard.creditCards[index]["expiryDate"]!,
      cardHolderName: smartCard.creditCards[index]["cardHolderName"]!,
      cvvCode: smartCard.creditCards[index]["cvvCode"]!,
      bankName: 'Tap Cash',
      frontCardBorder: !useGlassMorphism
          ? Border.all(color: Colors.grey)
          : null,
      backCardBorder: !useGlassMorphism
          ? Border.all(color: Colors.grey)
          : null,
      showBackView: isCvvFocused,
      obscureCardNumber: false,
      obscureCardCvv: false,
      isHolderNameVisible: true,
      cardBgColor: myColors.blu,
      backgroundImage: "assets/card/Card_pg.png",
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange:
          (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/card/mastercard.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }

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
                  margin: EdgeInsets.all(20),
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
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(1, 1.5),
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
                                    child: credit(index),
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
              return Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: myApplication.hightClc(200, context),),
                    Text("You don’t have Any active card",style: TextStyle(fontSize: myApplication.widthClc(22, context),fontWeight: FontWeight.w600),),
                    SizedBox(height: myApplication.hightClc(200, context),),
                    Container(
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
