import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/data_Maps/transaction_Map.dart';
import 'package:tap_cash/helper/widgets/transaction_widget.dart';
import 'package:tap_cash/presentation/transactionsAnddnotification/transactions.dart';

class kidsTransactionsScreen extends StatelessWidget {
  kidsTransactionsScreen({Key? key}) : super(key: key);


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
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: myApplication.widthClc(24, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        myApplication.navigateToReplace(context,transactionsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Me",
                          style: TextStyle(
                              fontSize: myApplication.widthClc(24, context),
                              fontWeight: FontWeight.bold,color: myColors.blu),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: myApplication.hightClc(700, context),
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Transactions.transaction.length,
                      itemBuilder: (context,index){
                        return Center(
                            child:transactionWidget(
                              color: Transactions.transaction[index]["color"],
                              name: Transactions.transaction[index]["name"],
                              inWallet: Transactions.transaction[index]["inWallet"],
                              icon: Transactions.transaction[index]["icon"],
                              date: Transactions.transaction[index]["date"],
                              amount: Transactions.transaction[index]["amount"],
                            )
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
