import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tap_cash/data/models/sign_In_Model.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/data_Maps/transaction_Map.dart';
import 'package:tap_cash/helper/widgets/bottomSheetWidget.dart';
import 'package:tap_cash/helper/widgets/transaction_widget.dart';
import 'package:tap_cash/presentation/add&send/requestAmount.dart';
import 'package:tap_cash/presentation/add&send/sendAmount.dart';
import 'package:tap_cash/presentation/bIlls/internet.dart';
import 'package:tap_cash/presentation/credit_Card/creditCard_Fill.dart';
import 'package:tap_cash/presentation/donations&shopping/donations.dart';
import 'package:tap_cash/presentation/donations&shopping/onlinPayment.dart';
import 'package:tap_cash/presentation/more/cashBack.dart';
import 'package:tap_cash/presentation/smartCard/exportCard.dart';
import 'package:tap_cash/presentation/transactions&notification/notifications.dart';
import 'package:tap_cash/presentation/transactions&notification/transactions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class home extends StatelessWidget {
  home({Key? key}) : super(key: key);

  final signIndata = signInModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: ListView(
          children: [
            //photo and hi
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ClipOval(
                      child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      "https://yt3.googleusercontent.com/ytc/AGIKgqNARqe1ySQ4HhxtFBmgL0MXOg-b-dps6N90hgO7=s900-c-k-c0x00ffffff-no-rj",
                      height: 45,
                      width: 45,
                    ),
                  )),
                  SizedBox(
                    width: myApplication.widthClc(15, context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: myApplication.widthClc(10, context),
                          ),
                          Image.asset(
                            "assets/Icons/hi.png",
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                      Text(
                        "Mohamed Refay",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: myColors.blu),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      myApplication.navigateTo(notifications(), context);
                    },
                    child: true ? Image.asset(
                      "assets/Icons/Bell_Icon.png",
                      height: 30,
                      width: 30,
                    ) : Image.asset(
                      "assets/Icons/bell_red.png",
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //balance and cash back
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(1, 1.5),
                    spreadRadius: 10,
                  )
                ],
              ),
              height: 132,
              width: 396,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/home/balance_bg.png",
                    height: 132,
                    width: 396,
                  ),
                  Positioned(
                      left: 48,
                      top: 18,
                      child: Text(
                        "Wallet Balance",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )),
                  Positioned(
                      left: 48,
                      top: 49,
                      child: Text(
                        "EGP: 625",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  Positioned(
                      left: 48,
                      top: 80,
                      child: GestureDetector(
                        onTap: (){
                          myApplication.navigateTo(cashBack(), context);
                        },
                        child: Container(
                          width: myApplication.widthClc(186, context),
                          height: myApplication.hightClc(28, context),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cash Back EGP: 100",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: myColors.blu,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: myApplication.widthClc(10, context),),
                                Icon(Icons.arrow_right_alt_outlined,color: myColors.blu,),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //add & send & smart card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 121,
              width: 396,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //ADD
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              width: double.infinity,
                              height: 450,
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 30,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        "Select how to add money to your tap cash acount",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      myApplication.navigateTo(
                                          creditCardFill(), context);
                                    },
                                    child: bottomSheetWidget(
                                        icon: Icon(
                                          FontAwesomeIcons.creditCard,
                                          color: myColors.blu,
                                        ),
                                        text: "Add Card"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      myApplication.push_up(
                                          context, requestAmount());
                                    },
                                    child: bottomSheetWidget(
                                        icon: Icon(
                                          Icons.people,
                                          color: myColors.blu,
                                          size: 30,
                                        ),
                                        text: "Request from tap cash friends"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: bottomSheetWidget(
                                        icon: Image.asset(
                                          "assets/bottomSheeet/fawry.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        text: "Add cash through fawry"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: bottomSheetWidget(
                                        icon: Image.asset(
                                          "assets/bottomSheeet/instapay.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        text: "Receive from instapay   "),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 63,
                          width: 63,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: myColors.softblu,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 35,
                            color: myColors.blu,
                          ),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                              color: myColors.blu,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  //Send
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              width: double.infinity,
                              height: 450,
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 30,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        "Select how to send money from your tap cash acount",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      myApplication.navigateTo(
                                          sendAmount(), context);
                                    },
                                    child: bottomSheetWidget(
                                        icon: Icon(
                                          Icons.people,
                                          color: myColors.blu,
                                          size: 30,
                                        ),
                                        text: "Send to tap cash friends"),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: bottomSheetWidget(
                                        icon: Image.asset(
                                          "assets/bottomSheeet/orangCash.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        text: "Orange Cash "),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: bottomSheetWidget(
                                        icon: Image.asset(
                                          "assets/bottomSheeet/etslatCash.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        text: "Etisalat Cash"),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: bottomSheetWidget(
                                        icon: Image.asset(
                                          "assets/bottomSheeet/vodafonCash.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        text: "Vodafon cash"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 63,
                          width: 63,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: myColors.softblu,
                          ),
                          child: Transform.rotate(
                              angle: -30 * math.pi / 180,
                              child: Icon(
                                Icons.send_rounded,
                                size: 30,
                                color: myColors.blu,
                              )),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),
                        Text(
                          "Send",
                          style: TextStyle(
                              color: myColors.blu,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  //smart card
                  GestureDetector(
                    onTap: () {
                      myApplication.navigateTo(exportsCard(), context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 63,
                          width: 63,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: myColors.softblu,
                          ),
                          child: Icon(
                            Icons.credit_card,
                            size: 35,
                            color: myColors.blu,
                          ),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),
                        Text(
                          "Smart Card",
                          style: TextStyle(
                              color: myColors.blu,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //cash back
            GestureDetector(
              onTap: (){
                myApplication.navigateTo(cashBack(), context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 101,
                width: 396,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 63,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.shade200,
                      ),
                      child: Icon(
                        Icons.card_giftcard_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You Get Cash Back!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(14, context),
                        ),
                        Text(
                          "You Get 50 EGP Cash Back From Payment",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //services
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 153,
              width: 396,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  color: myColors.blu,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myApplication.hightClc(10, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          myApplication.navigateTo(InternetProvider(), context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: "internet",
                              child: ClipRect(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: myApplication.hightClc(56, context),
                                      width: myApplication.widthClc(56, context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange.shade100,
                                      ),
                                      child: Icon(
                                        Icons.wifi,
                                        size: myApplication.widthClc(30, context),
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      height: myApplication.hightClc(10, context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),
                            Text(
                              "Internet",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.shade100,
                              ),
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),
                            Text(
                              "Shopping",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange.shade100,
                              ),
                              child: Icon(
                                Icons.electric_bolt,
                                size: 30,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),
                            Text(
                              "Electricity",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade100,
                              ),
                              child: Icon(
                                Icons.water_drop,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),
                            Text(
                              "Water",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //transactions
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 346,
              width: 396,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              myApplication.navigateTo(transactionsScreen(), context);
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  color: myColors.blu,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myApplication.hightClc(10, context),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return transactionWidget(
                          color: Transactions.transaction[index]["color"],
                          name: Transactions.transaction[index]["name"],
                          inWallet: Transactions.transaction[index]["inWallet"],
                          icon: Transactions.transaction[index]["icon"],
                          date: Transactions.transaction[index]["date"],
                          amount: Transactions.transaction[index]["amount"],
                        );
                      })
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //donation & purchase
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      myApplication.navigateTo(donations(), context);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 68,
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
                          child: Hero(
                            tag: "donation",
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset("assets/home/donation.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(16, context),
                        ),
                        Text(
                          "Donations",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: myApplication.widthClc(30, context),
                  ),
                  GestureDetector(
                    onTap: () {
                      myApplication.navigateTo(onlinePayment(), context);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 68,
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
                          child: Hero(
                            tag: "shopping",
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Icon(
                                Icons.monetization_on_outlined,
                                color: myColors.blu,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(16, context),
                        ),
                        Text(
                          "Online Payment",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: myApplication.hightClc(40, context),
            ),

            //Online Shops
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async{
                      await launchUrlString("https://www.amazon.com/",mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      height: 60,
                      width: 68,
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
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset("assets/images/amazon.png",),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: myApplication.widthClc(30, context),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await launchUrlString("https://www.amazon.com/",mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      height: 60,
                      width: 68,
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
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset("assets/images/souq.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: myApplication.widthClc(30, context),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await launchUrlString("https://www.noon.com/egypt-en/",mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      height: 60,
                      width: 68,
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
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset("assets/images/noon.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
