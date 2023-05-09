import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';

class creatPIN extends StatelessWidget {
  creatPIN({Key? key}) : super(key: key);

  String PIN = "";
  String ConfirmPIN = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  "Create PIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: myApplication.hightClc(24, context),
                ),
                const Text("Add PIN To Make Your Account More Secure",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: myApplication.hightClc(100, context),
                ),
                const Text("PIN"),
                SizedBox(
                  height: myApplication.hightClc(20, context),
                ),
                Center(
                  child: VerificationCode(
                      isSecure: true,
                      underlineColor: myColors.blu,
                      textStyle: Theme.of(context).textTheme.bodyLarge!,
                      underlineUnfocusedColor: Colors.transparent,
                      fillColor: Colors.grey.withOpacity(0.2),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      itemSize: 70,
                      fullBorder: true,
                      onCompleted: (c) {
                        PIN = c;
                      },
                      onEditing: (code) {}),
                ),
                SizedBox(
                  height: myApplication.hightClc(60, context),
                ),
                const Text("Confirm PIN"),
                SizedBox(
                  height: myApplication.hightClc(20, context),
                ),
                Center(
                  child: VerificationCode(
                      isSecure: true,
                      underlineColor: myColors.blu,
                      textStyle: Theme.of(context).textTheme.bodyLarge!,
                      underlineUnfocusedColor: Colors.transparent,
                      fillColor: Colors.grey.withOpacity(0.2),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      itemSize: 70,
                      fullBorder: true,
                      onCompleted: (c) {
                        ConfirmPIN = c;
                      },
                      onEditing: (code) {}),
                ),
                SizedBox(height: myApplication.hightClc(150, context)),
                BlocBuilder<InfoCubit, InfoState>(
                  builder: (context, state) {
                    if(state is InfoLoading){
                      return const Center(
                        child: CircularProgressIndicator(color: myColors.blu,),
                      );
                    }else{
                      return confirmButton(
                        ontap: (){
                          LocalAuthCubit.authenticate(context);
                        },
                          text: "Continue");
                    }

                  },
                ),
                SizedBox(
                  height: myApplication.hightClc(63, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
