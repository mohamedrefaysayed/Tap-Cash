import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/addMonyAmount/add_mony_amount_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';

class changeLimit extends StatelessWidget {
  changeLimit({Key? key}) : super(key: key);

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
                      "Change Limit Card",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(100, context),
                    ),
                    BlocBuilder<AddMonyAmountCubit, AddMonyAmountState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text("Limit Per Transaction",style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                fontWeight: FontWeight.w600),),
                            SizedBox(
                              height: myApplication.hightClc(20, context),
                            ),
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
                                  "EGP: ${ AddMonyAmountCubit.limitPerTransaction.toInt().toString()}",
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
                                divisions: 50,
                                thumbColor: myColors.softblu,
                                min: 0,
                                max: 100000,
                                value:  AddMonyAmountCubit.limitPerTransaction,
                                onChanged: (val) {
                                  AddMonyAmountCubit.limitPerTransaction = val;
                                  BlocProvider.of<AddMonyAmountCubit>(context)
                                      .emit(AddMonyAmountInitial());
                                }),
                            SizedBox(
                              height: myApplication.hightClc(80, context),
                            ),
                            Text("Cash Withdrawal Limit",style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                fontWeight: FontWeight.w600),),
                            SizedBox(
                              height: myApplication.hightClc(20, context),
                            ),
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
                                  "EGP: ${ AddMonyAmountCubit.cashWithDrawallimit.toInt().toString()}",
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
                                divisions: 50,
                                thumbColor: myColors.softblu,
                                min: 0,
                                max: 50000,
                                value: AddMonyAmountCubit.cashWithDrawallimit,
                                onChanged: (val) {
                                  AddMonyAmountCubit.cashWithDrawallimit = val;
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
                                      "Saved successfully",
                                          (_) => myApplication.navigateTo(
                                          mainScreen(), context));
                                }
                              },
                              text: "Save"),
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
