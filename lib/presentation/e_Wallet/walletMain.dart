// ignore_for_file: camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/business_logic/wallet/wallet_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/data_Maps/criditCard.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/credit_Card/creditCard_Fill.dart';
import 'package:tap_cash/presentation/e_Wallet/addMonyAmount.dart';
import 'package:tap_cash/presentation/e_Wallet/changeLimit.dart';
import 'package:tap_cash/presentation/e_Wallet/withdrawCarAmount.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class walletMain extends StatefulWidget {
   const walletMain({Key? key}) : super(key: key);

  @override
  State<walletMain> createState() => _walletMainState();
}

class _walletMainState extends State<walletMain> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("E-wallet",style: TextStyle(fontWeight: FontWeight.w600,

        fontSize: myApplication.widthClc(24, context)),),

        automaticallyImplyLeading: false,

      ),
      body: Column(

        children: [

          SizedBox(height: myApplication.hightClc(30, context),),

          Container(

            margin: const EdgeInsets.symmetric(horizontal: 40),

            child: Row(
              children: const [

                Text("Balance",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),

                Spacer(),

                Text("EGP : 500",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),

              ],
            ),
          ),

          SizedBox(height: myApplication.widthClc(24, context),),

          BlocConsumer<WalletCubit, WalletState>(

            listener: (context,state){

              if(state is WalletInitial){

                if(creditCardMap.creditCard.isEmpty){

                  BlocProvider.of<WalletCubit>(context).emit(WalletEmpty());

                }else{

                  BlocProvider.of<WalletCubit>(context).emit(WalletShowCards());

                }
              }

            },
            builder: (context, state) {

              if(state is WalletShowCards ){

                return Container(

                  margin: const EdgeInsets.symmetric(horizontal: 25),

                  child: Column(
                    children: [

                      SizedBox(

                        height: myApplication.hightClc(200, context),

                        child: ListView.builder(

                          shrinkWrap: true,

                            itemCount: creditCardMap.creditCard.length,

                            itemBuilder: (context,index){

                              return GestureDetector(

                                onTap: ()async{

                                  await LocalAuthCubit.authenticate(context);

                                  if(LocalAuthCubit.authenticated){
                                    showModalBottomSheet(
                                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),

                                        context: context,
                                        builder: (BuildContext context){

                                          return Container(

                                            height: 380,
                                            width: double.infinity,

                                            margin: const EdgeInsets.symmetric(horizontal: 42,vertical: 10),

                                            child: Column(

                                              children: [

                                                Text("Card",style: TextStyle(fontSize: myApplication.widthClc(18, context),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                                SizedBox(height: myApplication.hightClc(16, context),),

                                                myApplication.creditCard(creditCardMap.creditCard[index]["cardNumber"]!,
                                                    creditCardMap.creditCard[index]["expiryDate"]!,
                                                    creditCardMap.creditCard[index]["cardHolderName"]!,
                                                    creditCardMap.creditCard[index]["cvvCode"]!,false

                                                ),

                                                SizedBox(height: myApplication.hightClc(34, context),),

                                                GestureDetector(

                                                  onTap: () => myApplication.confirmDialog(context,
                                                      "Delete this card ?",
                                                      "Delete",
                                                      Colors.red,
                                                          (){

                                                        if(creditCardMap.creditCard.length==1){
                                                          creditCardMap.creditCard.clear();
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          BlocProvider.of<WalletCubit>(context).emit((WalletEmpty()));

                                                        }else{

                                                          creditCardMap.creditCard.removeAt(index);
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          BlocProvider.of<WalletCubit>(context).emit((WalletShowCards()));

                                                        }

                                                        showTopSnackBar(Overlay.of(context),
                                                            const mySnackBar.success(message: "Deleted Successfully")
                                                        );

                                                      }),
                                                  child: Align(

                                                    alignment: Alignment.centerRight,

                                                    child: Container(

                                                      width: myApplication.widthClc(100, context),

                                                      decoration: BoxDecoration(

                                                        borderRadius: BorderRadius.circular(75),

                                                        color: Colors.red.shade100.withOpacity(0.5),

                                                      ),

                                                      child: Row(

                                                        mainAxisAlignment: MainAxisAlignment.center,

                                                        children: [

                                                          const Icon(Icons.delete_outline_rounded,color: Colors.orange,),

                                                          SizedBox(width: myApplication.widthClc(10, context),),

                                                          Text("Delete",style: TextStyle(color: Colors.orange,
                                                              fontSize: myApplication.widthClc(14, context),
                                                              fontWeight: FontWeight.w400),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(height: myApplication.hightClc(34, context),),

                                                Container(

                                                  height: myApplication.hightClc(33, context),
                                                  width: myApplication.widthClc(343, context),

                                                  decoration: BoxDecoration(

                                                      color: myColors.softblu,

                                                      borderRadius: BorderRadius.circular(75)
                                                  ),

                                                  child: Row(

                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [

                                                      const Icon(Icons.warning_amber,size: 20,color: myColors.blu,),

                                                      SizedBox(width: myApplication.widthClc(10, context),),

                                                      Text("Please don’t share this with any one",
                                                        style: TextStyle(fontSize: myApplication.widthClc(12, context),
                                                            fontWeight: FontWeight.w500,
                                                            color: myColors.blu),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          );
                                        });
                                  }

                                },

                                child: SizedBox(

                                  child:  myApplication.creditCard(creditCardMap.creditCard[index]["cardNumber"]!,
                                      creditCardMap.creditCard[index]["expiryDate"]!,
                                      creditCardMap.creditCard[index]["cardHolderName"]!,
                                      creditCardMap.creditCard[index]["cvvCode"]!,
                                      true
                                  ),

                                  height: myApplication.hightClc(200, context),

                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

               else{

                return SizedBox(

                  width: double.infinity,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      SizedBox(height: myApplication.hightClc(50, context),),

                      Text("You don’t have a card",
                        style: TextStyle(fontSize: myApplication.widthClc(22, context),
                            fontWeight: FontWeight.w600),),

                      SizedBox(height: myApplication.hightClc(22, context),),

                      Text("Add credit /debit card",
                        style: TextStyle(fontSize: myApplication.widthClc(14, context),
                            fontWeight: FontWeight.w400),),

                      SizedBox(height: myApplication.hightClc(50, context),),

                    ],
                  ),
                );
              }
            },
          ),

          Container(

            margin: EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context)),

            child: Column(

              children: [

                SizedBox(height: myApplication.widthClc(25, context),),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    GestureDetector(

                      onTap: (){

                        showModalBottomSheet(

                          shape:RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(20),

                          ),
                            context: context,

                            builder: (BuildContext context){
                              return Container(

                                color: Theme.of(context).scaffoldBackgroundColor,

                                height: myApplication.hightClc(352, context),

                                child: Column(
                                  children: [

                                    SizedBox(height: myApplication.hightClc(20, context),),

                                    Text("choose card",style: TextStyle(fontSize: myApplication.widthClc(18, context),
                                    fontWeight: FontWeight.w600),),

                                    SizedBox(height: myApplication.hightClc(10, context),),

                                    SizedBox(
                                      height: myApplication.hightClc(250, context),
                                      child: creditCardMap.creditCard.isEmpty
                                          ? Center(
                                        child: Text("No Cards",style: TextStyle(
                                          fontSize: myApplication.widthClc(16, context),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      )

                                          : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: creditCardMap.creditCard.length,
                                          itemBuilder: (context,index){

                                            return GestureDetector(

                                              onTap: (){
                                                Navigator.pop(context);
                                                myApplication.navigateTo(addMonyAmount(index: index), context);
                                              },

                                              child: Container(

                                                height: myApplication.hightClc(81, context),

                                                margin: EdgeInsets.all(myApplication.widthClc(17, context),),

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

                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                  children: [

                                                    Text(
                                                      creditCardMap.creditCard[index]["cardHolderName"]!,
                                                      style: TextStyle(
                                                        fontSize: myApplication.widthClc(16, context),
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),

                                                    Text(
                                                      "${creditCardMap.creditCard[index]["cardNumber"]!.substring(0,4)} **** **** ${creditCardMap.creditCard[index]["cardNumber"]!.substring(12,16)}",
                                                      style: TextStyle(
                                                        fontSize: myApplication.widthClc(16, context),
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      ),

                                    ),
                                  ],
                                ),
                              );
                            });
                      },

                      child: Container(

                        height: myApplication.hightClc(56, context),
                        width: myApplication.widthClc(149, context),

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(75),

                          boxShadow: [

                            BoxShadow(
                              color: myColors.shadow,
                              blurRadius: 10,
                              offset: const Offset(1, 1.5),
                              spreadRadius: 10,
                            )

                          ],

                          color: Theme.of(context).scaffoldBackgroundColor,

                        ),
                        child: const Center(child: Text("Add Money",
                          style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 14,color: myColors.blu),)),

                      ),
                    ),

                    GestureDetector(

                      onTap: (){
                        showModalBottomSheet(

                            shape:RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(20),

                            ),

                            context: context,
                            builder: (BuildContext context){

                              return Container(

                                color: Theme.of(context).scaffoldBackgroundColor,

                                height: myApplication.hightClc(352, context),

                                child: Column(
                                  children: [

                                    SizedBox(height: myApplication.hightClc(20, context),),

                                    Text("choose card",style: TextStyle(fontSize: myApplication.widthClc(18, context),
                                        fontWeight: FontWeight.w600),),

                                    SizedBox(height: myApplication.hightClc(10, context),),

                                    SizedBox(
                                      height: myApplication.hightClc(250, context),
                                      child: creditCardMap.creditCard.isEmpty
                                          ? Center(
                                        child: Text("No Cards",style: TextStyle(
                                          fontSize: myApplication.widthClc(16, context),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      )

                                          : ListView.builder(

                                          shrinkWrap: true,

                                          itemCount: creditCardMap.creditCard.length,

                                          itemBuilder: (context,index){

                                            return GestureDetector(

                                              onTap: (){
                                                Navigator.pop(context);

                                                myApplication.navigateTo(withdarwCarAmount(index: index), context);

                                              },

                                              child: Container(

                                                height: myApplication.hightClc(81, context),

                                                margin: EdgeInsets.all(myApplication.widthClc(17, context),),

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

                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                  children: [

                                                    Text(
                                                      creditCardMap.creditCard[index]["cardHolderName"]!,
                                                      style: TextStyle(
                                                        fontSize: myApplication.widthClc(16, context),
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),

                                                    Text(
                                                      "${creditCardMap.creditCard[index]["cardNumber"]!.substring(0,4)} **** **** ${creditCardMap.creditCard[index]["cardNumber"]!.substring(12,16)}",                                                      style: TextStyle(
                                                        fontSize: myApplication.widthClc(16, context),
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      ),

                                    ),
                                  ],
                                ),
                              );
                            });
                      },

                      child: Container(

                        height: myApplication.hightClc(56, context),

                        width: myApplication.widthClc(149, context),

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(75),

                          boxShadow: [

                            BoxShadow(
                              color: myColors.shadow,
                              blurRadius: 10,
                              offset: const Offset(1, 1.5),
                              spreadRadius: 10,
                            )

                          ],

                          color: Theme.of(context).scaffoldBackgroundColor,

                        ),

                        child: const Center(child: Text("Withdraw",
                          style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 14,color: myColors.blu),)),

                      ),
                    ),
                  ],
                ),

                SizedBox(height: myApplication.widthClc(28, context),),

                Container(

                  height: myApplication.hightClc(195, context),
                  width: myApplication.widthClc(396, context),

                  decoration: BoxDecoration(

                    boxShadow: [

                      BoxShadow(
                        color: myColors.shadow,
                        blurRadius: 10,
                        offset: const Offset(1, 1.5),
                        spreadRadius: 10,
                      )

                    ],

                    color: Theme.of(context).scaffoldBackgroundColor,

                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Container(

                    margin: const EdgeInsets.all(34),

                    child: Column(
                      children: [
                        Row(

                          children: [

                            Text("Limit Sitting",
                              style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                  fontWeight: FontWeight.w600,
                                  color: myColors.blu),),

                            const Spacer(),

                            GestureDetector(

                              onTap: ()async{
                                await LocalAuthCubit.authenticate(context);
                                if(LocalAuthCubit.authenticated){
                                  myApplication.navigateTo(const changeLimit(), context);
                                }

                              },
                              child: Container(

                                height: myApplication.hightClc(38, context),
                                width: myApplication.widthClc(96, context),

                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(75),

                                  color: myColors.blu,

                                ),
                                child: Row(

                                  mainAxisAlignment:MainAxisAlignment.center,

                                  children: [

                                    Icon(Icons.mode_edit_outline_outlined,
                                      color: Colors.white,
                                      size: myApplication.widthClc(20, context),
                                    ),

                                    SizedBox(width: myApplication.widthClc(5, context),),

                                    Text("Edit",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Divider(color: Theme.of(context).textTheme.bodyMedium!.color,),

                        SizedBox(height: myApplication.hightClc(14, context),),

                        Row(
                          children: [

                            Text("Limit per transaction",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w400,color: Colors.grey
                            ),
                           ),
                            const Spacer(),

                            Text("EGP :1000",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          ],
                        ),

                        SizedBox(height: myApplication.hightClc(22, context),),

                        Row(

                          children: [

                            Text("Cash withdrawal limit",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w400,color: Colors.grey
                            ),

                        ),
                            const Spacer(),

                            Text("EGP : 500",style: TextStyle(fontSize: myApplication.widthClc(14, context),
                                fontWeight: FontWeight.w600
                            ),

                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: myApplication.widthClc(18, context),),

                SizedBox(

                  width: double.infinity,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [

                      GestureDetector(

                        onTap:(){
                          myApplication.navigateTo( const creditCardFill(), context);
                        },

                        child: SizedBox(

                          height: myApplication.hightClc(58, context),
                          width: myApplication.widthClc(58, context),

                          child: Stack(

                            children: [

                              Image.asset("assets/bottomNavFloat/bottomNavBg.png",  height: myApplication.hightClc(58, context),
                                width: myApplication.widthClc(58, context),),

                              const Center(child: Icon(Icons.add))

                            ],
                          ),
                        ),
                      ),

                      Text("Add Card",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: myApplication.widthClc(14, context),
                          color: myColors.blu
                      ),
                     ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
