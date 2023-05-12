// ignore_for_file: dead_code, camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/business_logic/QR/qr_cubit.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/presentation/donations&shopping/donations.dart';
import 'package:tap_cash/presentation/donations&shopping/onlinPayment.dart';
import 'package:tap_cash/presentation/more/cashBack.dart';
import 'package:tap_cash/presentation/qrCode/showQR.dart';
import 'package:tap_cash/presentation/smartCard/exportCard.dart';
import 'package:tap_cash/presentation/transactions&notification/notifications.dart';
import 'package:url_launcher/url_launcher_string.dart';

class kidHome extends StatelessWidget {
  const kidHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      
      onWillPop: (){
        return myApplication.onWillPop(context);
      },
      
      child: Scaffold(
        
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
                          child: Image.network(
                            "https://yt3.googleusercontent.com/ytc/AGIKgqNARqe1ySQ4HhxtFBmgL0MXOg-b-dps6N90hgO7=s900-c-k-c0x00ffffff-no-rj",
                            
                            height: myApplication.hightClc(45, context),
                            width: myApplication.widthClc(45, context),
                            
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
                        ),
                       
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
                        ),
                       
                     ),
                    Positioned(
                      
                        left: myApplication.hightClc(48, context),
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
              

              //smart card & spin&win
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
                    )
                  ],

                ),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [


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


                    //spin&win
                    GestureDetector(

                      onTap: () {},

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

                            child: Image.asset("assets/kidHome/spin&win.png")

                          ),

                          SizedBox(
                            height: myApplication.hightClc(10, context),
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


              Container(

                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),

                child: Column(

                  children: [

                    Text("Categories",style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize: myApplication.widthClc(22, context)),),

                    SizedBox(height: myApplication.hightClc(10, context),),

                    Column(

                      children: [

                        GestureDetector(

                          onTap: (){
                            myApplication.navigateTo(onlinePayment(), context);
                          },

                          child: Container(

                            margin: const EdgeInsets.symmetric(vertical: 10),

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

                            child: Container(

                              height: myApplication.hightClc(81, context),
                              width: myApplication.widthClc(369, context),

                              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                              child: Row(

                                children: [

                                  Image.asset("assets/kidHome/food.png",

                                    height: myApplication.hightClc(34, context),
                                    width: myApplication.widthClc(34, context),
                                  ),

                                  const Spacer(),

                                  Text("Food and drinks ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: myApplication.widthClc(16, context)),),

                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(

                              children: [

                                Image.asset("assets/kidHome/games.png",
                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),
                                ),

                                const Spacer(),

                                Text("Games",
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: myApplication.widthClc(16, context)
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(

                              children: [

                                Image.asset("assets/kidHome/gifts.png",
                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),
                                ),

                                const Spacer(),

                                Text("Gifts",
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: myApplication.widthClc(16,
                                          context)),),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(

                              children: [

                                Image.asset("assets/kidHome/shopping.png",
                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),
                                ),

                                const Spacer(),

                                Text("Shpping",
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: myApplication.widthClc(16, context)
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(

                              children: [

                                Image.asset("assets/kidHome/ent.png",

                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),

                                ),

                                const Spacer(),

                                Text("Entertainment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: myApplication.widthClc(16, context)),),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(
                              children: [

                                Image.asset("assets/kidHome/schoolsupp.png",
                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),
                                ),

                                const Spacer(),

                                Text("School Supplies",style: TextStyle(fontWeight: FontWeight.w600,fontSize: myApplication.widthClc(16, context)),),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 10),

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

                          child: Container(

                            height: myApplication.hightClc(81, context),
                            width: myApplication.widthClc(369, context),

                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),

                            child: Row(

                              children: [

                                Image.asset("assets/kidHome/transportation.png",
                                  height: myApplication.hightClc(34, context),
                                  width: myApplication.widthClc(34, context),
                                ),

                                const Spacer(),

                                Text("Transportation",
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: myApplication.widthClc(16, context),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                                child: Image.asset("assets/kidHome/donations.png"),
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

              SizedBox(
                height: myApplication.hightClc(40, context),
              ),

            ],
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: GestureDetector(

          onTap: ()async{
            QrCubit.QrCodeData = await scanner.scan().whenComplete(() {
              myApplication.navigateTo(showQrCode(), context);
            }
           );

          },

          child: SizedBox(

            height: myApplication.hightClc(70, context),
            width: myApplication.widthClc(70, context),

            child: Stack(

              children: [

                Image.asset("assets/bottomNavFloat/bottomNavBg.png",height: 70,width: 70,),

                Center(child: Image.asset("assets/bottomNavFloat/scan.png",height: 23,width: 23,)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
