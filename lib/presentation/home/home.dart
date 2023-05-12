// ignore_for_file: dead_code, camel_case_types

import 'dart:math' as math;
import 'package:flutter/material.dart';
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
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        margin: const EdgeInsets.symmetric(vertical: 40),

        child: ListView(

          children: [

            //photo and hi
            Container(

              margin: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(

                children: [

                  ClipOval(

                      child: FittedBox(

                    fit: BoxFit.cover,

                    child: Image.asset(

                      "assets/profilePhoto.jpg",
                      height: myApplication.hightClc(45, context),
                      width: myApplication.widthClc(45, context),

                    ),
                  )
                ),

                  SizedBox(
                    width: myApplication.widthClc(15, context),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          const Text(
                            "Welcome Back",
                            style: TextStyle(fontSize: 18),
                          ),

                          SizedBox(
                            width: myApplication.widthClc(10, context),
                          ),

                          Image.asset(
                            "assets/Icons/hi.png",
                            height: myApplication.hightClc(20, context),
                            width: myApplication.widthClc(20, context),
                          ),

                        ],
                      ),

                      const Text(
                        "Mohamed Refay",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: myColors.blu),
                      ),

                    ],
                  ),

                  const Spacer(),

                  GestureDetector(

                    onTap: (){
                      myApplication.navigateTo(const notifications(), context);
                    },

                    child: false ? Image.asset(
                      "assets/Icons/Bell_Icon.png",
                      height: 30,
                      width: 30,
                    ) : Image.asset(
                      "assets/Icons/bell_red.png",
                      height: myApplication.hightClc(30, context),
                      width: myApplication.widthClc(30, context),
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

              margin: const EdgeInsets.symmetric(horizontal: 20),

              decoration: BoxDecoration(
                boxShadow: [

                  BoxShadow(
                    color: myColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(1, 1.5),
                    spreadRadius: 10,
                  )
                ],
              ),

              height: myApplication.hightClc(132, context),
              width: myApplication.widthClc(396, context),

              child: Stack(

                children: [

                  Image.asset(
                    "assets/home/balance_bg.png",
                    height: myApplication.hightClc(132, context),
                    width: myApplication.widthClc(396, context),
                  ),

                   Positioned(
                      left: myApplication.widthClc(48, context),
                      top: myApplication.hightClc(18, context),
                      child: const Text(
                        "Wallet Balance",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                  ),

                   Positioned(
                      left: myApplication.widthClc(48, context),
                      top: myApplication.hightClc(49, context),
                      child: const Text(
                        "EGP: 625",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                  ),

                  Positioned(

                      left: myApplication.widthClc(48, context),
                      top: myApplication.hightClc(80, context),

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

                                const Text(
                                  "Cash Back EGP: 100",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: myColors.blu,
                                      fontWeight: FontWeight.w500),
                                ),

                                SizedBox(width: myApplication.widthClc(10, context),),

                                const Icon(Icons.arrow_right_alt_outlined,color: myColors.blu,),

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

              margin: const EdgeInsets.symmetric(horizontal: 20),

              height: myApplication.hightClc(121, context),
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
                  ),

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

                                color: Theme.of(context).scaffoldBackgroundColor,

                                borderRadius: const BorderRadius.only(

                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)
                                ),
                              ),

                              width: double.infinity,
                              height: myApplication.hightClc(450, context),

                              child: Column(

                                children: [

                                  Container(

                                      margin:  EdgeInsets.only(

                                        left: myApplication.widthClc(40, context),
                                        right: myApplication.widthClc(40, context),
                                        top: myApplication.hightClc(30, context),
                                        bottom: myApplication.hightClc(10, context),

                                      ),

                                      child: const Text(
                                        "Select how to add money to your tap cash acount",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )
                                  ),

                                  GestureDetector(

                                    onTap: () {
                                      Navigator.pop(context);
                                      myApplication.navigateTo(
                                           const creditCardFill(), context);
                                    },

                                    child: const bottomSheetWidget(
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

                                    child: const bottomSheetWidget(
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
                                          height: myApplication.hightClc(40, context),
                                          width: myApplication.widthClc(40, context),
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
                                          height: myApplication.hightClc(40, context),
                                          width: myApplication.widthClc(40, context),
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

                          height: myApplication.hightClc(63, context),
                          width: myApplication.widthClc(63, context),

                          decoration: const BoxDecoration(

                            shape: BoxShape.circle,

                            color: myColors.softblu,

                          ),

                          child: const Icon(
                            Icons.add,
                            size: 35,
                            color: myColors.blu,
                          ),

                        ),

                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),

                        const Text(
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
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),

                              width: double.infinity,
                              height: myApplication.hightClc(450, context),

                              child: Column(
                                children: [

                                  Container(

                                      margin:  EdgeInsets.only(
                                        left: myApplication.widthClc(40, context),
                                        right: myApplication.widthClc(40, context),
                                        top: myApplication.hightClc(30, context),
                                        bottom: myApplication.hightClc(10, context),
                                      ),

                                      child: const Text(
                                        "Select how to send money from your tap cash acount",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )
                                  ),

                                  GestureDetector(

                                    onTap: () {
                                      Navigator.pop(context);
                                      myApplication.navigateTo(
                                          sendAmount(), context);
                                    },

                                    child: const bottomSheetWidget(
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
                                          height: myApplication.hightClc(40, context),
                                          width: myApplication.widthClc(40, context),
                                        ),
                                        text: "Orange Cash "),
                                  ),

                                  GestureDetector(

                                    onTap: () {},

                                    child: bottomSheetWidget(

                                        icon: Image.asset(
                                          "assets/bottomSheeet/etslatCash.png",
                                          height: myApplication.hightClc(40, context),
                                          width: myApplication.widthClc(40, context),
                                        ),
                                        text: "Etisalat Cash"),
                                  ),

                                  GestureDetector(

                                    onTap: () {},

                                    child: bottomSheetWidget(

                                        icon: Image.asset(

                                          "assets/bottomSheeet/vodafonCash.png",
                                          height: myApplication.hightClc(40, context),
                                          width: myApplication.widthClc(40, context),

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

                          height: myApplication.hightClc(63, context),
                          width: myApplication.widthClc(63, context),

                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: myColors.softblu,
                          ),

                          child: Transform.rotate(
                              angle: -30 * math.pi / 180,
                              child: const Icon(
                                Icons.send_rounded,
                                size: 30,
                                color: myColors.blu,
                              )
                          ),

                        ),

                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),

                        const Text(
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

                          height: myApplication.hightClc(63, context),
                          width: myApplication.widthClc(63, context),

                          decoration: const BoxDecoration(

                            shape: BoxShape.circle,

                            color: myColors.softblu,

                          ),
                          child: const Icon(
                            Icons.credit_card,
                            size: 35,
                            color: myColors.blu,
                          ),
                        ),

                        SizedBox(
                          height: myApplication.hightClc(10, context),
                        ),

                        const Text(
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

                margin: const EdgeInsets.symmetric(horizontal: 20),

                height: myApplication.hightClc(101, context),
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
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Container(

                      height: myApplication.hightClc(63, context),
                      width: myApplication.widthClc(70, context),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.shade200,
                      ),

                      child: const Icon(
                        Icons.card_giftcard_rounded,
                        size: 40,
                        color: Colors.white,
                      ),

                    ),

                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        const Text(
                          "You Get Cash Back!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: myApplication.hightClc(14, context),
                        ),

                        const Text(
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

              margin: const EdgeInsets.symmetric(horizontal: 20),

              height: myApplication.hightClc(153, context),
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

              child: Column(

                children: [

                  Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 13),

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),

                        TextButton(

                            onPressed: () {},

                            child: const Text(
                              "See All",
                              style: TextStyle(
                                  color: myColors.blu,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                        )
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
                          myApplication.navigateTo(const InternetProvider(), context);
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

                            const Text(
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
                              height: myApplication.hightClc(56, context),
                              width: myApplication.widthClc(56, context),

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,

                                color: Colors.green.shade100,

                              ),

                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.green,
                              ),

                            ),

                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),

                            const Text(
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

                              height: myApplication.hightClc(56, context),
                              width: myApplication.widthClc(56, context),

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,

                                color: Colors.orange.shade100,

                              ),

                              child: const Icon(
                                Icons.electric_bolt,
                                size: 30,
                                color: Colors.orange,
                              ),

                            ),

                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),

                            const Text(
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
                              height: myApplication.hightClc(56, context),
                              width: myApplication.widthClc(56, context),

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,

                                color: Colors.blue.shade100,

                              ),

                              child: const Icon(
                                Icons.water_drop,
                                size: 30,
                                color: Colors.blue,
                              ),

                            ),

                            SizedBox(
                              height: myApplication.hightClc(10, context),
                            ),

                            const Text(
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

              margin: const EdgeInsets.symmetric(horizontal: 20),

              height: myApplication.hightClc(346, context),
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

              child: Column(

                children: [

                  Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 13),

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Transactions",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),

                        TextButton(
                            onPressed: () {
                              myApplication.navigateTo(const transactionsScreen(), context);
                            },
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                  color: myColors.blu,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: myApplication.hightClc(10, context),
                  ),

                  ListView.builder(

                      physics: const NeverScrollableScrollPhysics(),

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

                      }
                   ),
                ],
              ),
            ),

            SizedBox(
              height: myApplication.hightClc(23, context),
            ),

            //donation & purchase
            Container(

              margin: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(

                children: [

                  GestureDetector(

                    onTap: () {
                      myApplication.navigateTo(const donations(), context);
                    },

                    child: Column(

                      children: [

                        Container(

                          height: myApplication.hightClc(60, context),
                          width: myApplication.widthClc(68, context),
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

                        const Text(
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

                          height: myApplication.hightClc(60, context),
                          width: myApplication.widthClc(68, context),

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

                          child: const Hero(

                            tag: "shopping",

                            child: Padding(

                              padding: EdgeInsets.all(15),

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

                        const Text(
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

              margin: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(

                children: [


                  GestureDetector(
                    onTap: () async{
                      await launchUrlString("https://www.amazon.com/",mode: LaunchMode.externalApplication);
                    },

                    child: Container(

                      height: myApplication.hightClc(60, context),
                      width: myApplication.widthClc(68, context),

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

                      height: myApplication.hightClc(60, context),
                      width: myApplication.widthClc(68, context),

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

                      height: myApplication.hightClc(60, context),
                      width: myApplication.widthClc(68, context),

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
