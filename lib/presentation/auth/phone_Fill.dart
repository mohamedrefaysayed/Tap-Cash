import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/null_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/code_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class phoneFill extends StatelessWidget {
  final title;
  bool reset;
  phoneFill({Key? key, required this.title, required this.reset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: (){
          SignUpCubit.phoneIsVaild = false;
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: myApplication.backIcon(context,(){SignUpCubit.phoneIsVaild = false;})
          ),
                body: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      SizedBox(
                        height: myApplication.hightClc(170, context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/Icons/Egypt_Flag.png",height: 30,width: 30,),
                            SizedBox(width: 10,),
                            Text("+20 |",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                style: Theme.of(context).textTheme.bodyMedium,
                                onChanged: (num){
                                  SignUpCubit.phoneNumber = "+2"+num;
                                  BlocProvider.of<SignUpCubit>(context).checkNumber();
                                  print(SignUpCubit.phoneNumber);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(),
                                  hintStyle: TextStyle(fontSize: 18),
                                  hintText: "000 000 0000",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return Expanded(
                            child: Column(
                              children: [
                                Spacer(),
                                SignUpCubit.phoneIsVaild
                                    ? confirmButton(
                                    ontap: () {
                                      if(true){
                                        showTopSnackBar(
                                          Overlay.of(context),
                                          mySnackBar.success(
                                              message: "code has been send to " +
                                                  SignUpCubit.phoneNumber.substring(0,7)+"****"+SignUpCubit.phoneNumber.substring(11,13)),
                                        );
                                        BlocProvider.of<SignUpCubit>(context).sentVerfication();
                                        myApplication.navigateTo(codeFill(title:
                                        reset
                                            ? Text(
                                          "Forget Password",
                                          style: TextStyle(
                                              fontSize: myApplication.widthClc(24, context),
                                              fontWeight: FontWeight.bold),
                                        )
                                            : Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Text(
                                              "Please Verify Your Phone ",
                                              style: TextStyle(
                                                  fontSize: myApplication.widthClc(24, context),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Number",
                                              style: TextStyle(
                                                  fontSize: myApplication.widthClc(24, context),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                          reset: reset,
                                        ), context);
                                      }
                                    },
                                    text: reset ? "send" : "Continue",)
                                    : nullButton(text: reset ? "send" : "Continue",),
                                SizedBox(
                                  height: myApplication.hightClc(25, context),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "terms and conditions & privacy policy",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize:
                                        myApplication.widthClc(12, context),
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
