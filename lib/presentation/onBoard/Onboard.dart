// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/onBoard/on_board_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/presentation/auth/sign_Up.dart';

class onBoard extends StatelessWidget {
  onBoard({Key? key}) : super(key: key);

  PageController pageController = PageController(initialPage: 0);
  int? selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          selectedPage = page;
          BlocProvider.of<OnBoardCubit>(context)
              .emit(OnBoardInitial());
        },
        children: [
          GestureDetector(
            onTap: (){
              pageController.jumpToPage(1);
            },
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/onBoard/onBoard1.png",height: myApplication.hightClc(253, context),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: myApplication.widthClc(40, context)),
                    child: Column(
                      children: [
                        Text("Track Your Spending",style: TextStyle(fontSize: myApplication.widthClc(28, context),fontWeight: FontWeight.w700),),
                        SizedBox(height: myApplication.hightClc(10, context),),
                        Text("Simplify your financial tracking",style: TextStyle(fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.w400),),
                        Text("with easy-to-use tools for your spending",style: TextStyle(fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.w400),),


                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          height: myApplication.hightClc(115, context),
                          width: myApplication.widthClc(115, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: myColors.blu,width: 6)
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: myColors.blu,
                            ),
                            child: Icon(Icons.arrow_forward_outlined,size: myApplication.widthClc(30, context),color: Colors.white,),

                          ),
                        ),
                      ),
                      SizedBox(height: myApplication.hightClc(30, context),),
                      GestureDetector(
                        onTap: (){
                          myApplication.navigateTo(const signUp(), context);
                        },
                          child: Text("Skip",style: TextStyle(fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.w600,color: Colors.grey),)),

                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              myApplication.navigateTo(const signUp(), context);
            },
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/onBoard/onBoard2.png",height: myApplication.hightClc(253, context),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: myApplication.widthClc(40, context)),
                    child: Column(
                      children: [
                        Text("Manage Your Bills",style: TextStyle(fontSize: myApplication.widthClc(28, context),fontWeight: FontWeight.w700),),
                        SizedBox(height: myApplication.hightClc(10, context),),
                        Text("Stay on top of payments with",style: TextStyle(fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.w400),),
                        Text("bill management tools that simplify tracking",style: TextStyle(fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.w400),),


                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          height: myApplication.hightClc(115, context),
                          width: myApplication.widthClc(115, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: myColors.blu,width: 6)
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: myColors.blu,
                            ),
                            child: Icon(Icons.arrow_forward_outlined,size: myApplication.widthClc(30, context),color: Colors.white,),

                          ),
                        ),
                      ),
                      SizedBox(height: myApplication.hightClc(30, context),),

                    ],
                  )
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}
