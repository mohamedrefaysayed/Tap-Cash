import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tap_cash/business_logic/addMonyAmount/add_mony_amount_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/data_Maps/criditCard.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/credit_Card/myCreditCard.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class withdarwCarAmount extends StatefulWidget {
  final int index;
  withdarwCarAmount({Key? key, required this.index}) : super(key: key);

  @override
  State<withdarwCarAmount> createState() => _withdarwCarAmountState();
}

class _withdarwCarAmountState extends State<withdarwCarAmount> {
  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  UnderlineInputBorder? border =
  UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  credit(index, bool scure) {
    return myCreditCardWidget(
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'halter',
        fontSize: 12,
        package: 'flutter_credit_card',
      ),
      glassmorphismConfig:
      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
      cardNumber: creditCardMap.creditCard[index]["cardNumber"]!,
      expiryDate: creditCardMap.creditCard[index]["expiryDate"]!,
      cardHolderName: creditCardMap.creditCard[index]["cardHolderName"]!,
      cvvCode: creditCardMap.creditCard[index]["cvvCode"]!,
      bankName: 'Tap Cash',
      frontCardBorder:
      !useGlassMorphism ? Border.all(color: Colors.grey) : null,
      backCardBorder: !useGlassMorphism ? Border.all(color: Colors.grey) : null,
      showBackView: isCvvFocused,
      obscureCardNumber: scure,
      obscureCardCvv: scure,
      isHolderNameVisible: true,
      cardBgColor: myColors.blu,
      backgroundImage: "assets/card/Card_pg.png",
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
              body: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdraw Money",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),
                    credit(widget.index, true),
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
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(1, 1.5),
                                    spreadRadius: 10,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "EGP: ${AddMonyAmountCubit.amount.toInt().toString()}",
                                  style: TextStyle(
                                      fontSize: myApplication.widthClc(24, context),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              height: myApplication.hightClc(48, context),
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
                              ontap: () async {
                                await LocalAuthCubit.authenticate(context);
                                if (LocalAuthCubit.authenticated) {
                                  myApplication.doneDialog(
                                      context,
                                      "Recoverd successfully",
                                          (_) => myApplication.navigateTo(
                                          mainScreen(), context));
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
