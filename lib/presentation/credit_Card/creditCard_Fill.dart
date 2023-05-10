import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_details.dart';
import 'package:credit_card_scanner/models/card_scan_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tap_cash/business_logic/creditCard/credit_card_cubit.dart';
import 'package:tap_cash/business_logic/wallet/wallet_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/criditCard.dart';
import 'package:tap_cash/helper/widgets/credit_Card/myCreditCard.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../helper/widgets/credit_Card/myCreditCardForm.dart';

class creditCardFill extends StatefulWidget {
  @override
  State<creditCardFill> createState() => _creditCardFillState();
}


class _creditCardFillState extends State<creditCardFill> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  UnderlineInputBorder? border = UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    enableLuhnCheck: false,
    validCardsToScanBeforeFinishingScan: 5,
  );

  saveCreditCard(){
    Map<String,String>creditCard = {
      "cardNumber": cardNumber,
      "expiryDate": expiryDate,
      "cardHolderName": cardHolderName,
      "cvvCode" : cvvCode,
    };
    creditCardMap.creditCard.add(creditCard);
    showTopSnackBar(Overlay.of(context),
        mySnackBar.success(message: "added")
    );
  }

  Future<void> scanCard() async {
    final CardDetails? cardDetails =
    await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    _cardDetails = cardDetails;
    creditCardModel!.cardNumber = _cardDetails!.cardNumber;
    mycardNumberController.text = _cardDetails!.cardNumber;
    creditCardModel!.expiryDate = _cardDetails!.expiryDate;
    myexpiryDateController.text = _cardDetails!.expiryDate;
    BlocProvider.of<CreditCardCubit>(context).emit(CreditCardUpdate());

    onCreditCardModelChange(CreditCardModel(
        _cardDetails!.cardNumber, _cardDetails!.expiryDate, "", "", false));
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(leading: myApplication.backIcon(context, () {})),
        body: BlocConsumer<CreditCardCubit, CreditCardState>(
          listener: (context,State){
            if(State is CreditCardInitial){
            }
          },
          builder: (context, state) {
            return Container(
              color: Theme.of(context).dialogBackgroundColor,
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  myCreditCardWidget(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'halter',
                      fontSize: 12,
                      package: 'flutter_credit_card',
                    ),
                    glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Tap Cash',
                    frontCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    backCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
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
                  ),
                  Column(
                    children: <Widget>[
                      myCreditCardForm(
                        textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: myColors.blu,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .color!),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                          hintText: 'Your Name',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => scanCard(),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/bottomNavFloat/bottomNavBg.png",height: 70,width: 70,),
                                Image.asset("assets/bottomNavFloat/scan.png",height: 23,width: 23,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: _onValidate,
                        child: Container(
                          height: myApplication.hightClc(50, context),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: myColors.blu,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'Add Card',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
      saveCreditCard();
      myApplication.navigateTo(mainScreen(), context);
      BlocProvider.of<WalletCubit>(context).emit(WalletShowCards());
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    BlocProvider.of<CreditCardCubit>(context).emit(CreditCardUpdate());

  }
}