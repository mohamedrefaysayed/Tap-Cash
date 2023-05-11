// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/business_logic/local_Auth/local_auth_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class creatPIN extends StatelessWidget {
  const creatPIN({Key? key}) : super(key: key);



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
                        InfoCubit.PIN = c;
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
                        InfoCubit.ConfirmPIN = c;
                      },
                      onEditing: (code) {}),
                ),

                SizedBox(height: myApplication.hightClc(150, context)),

                BlocConsumer<InfoCubit, InfoState>(

                  listener: (context,state){

                    if(state is InfoSuccess){

                      showTopSnackBar(Overlay.of(context),
                      const mySnackBar.success(message: "All Done")
                      );

                      myApplication.navigateToRemove(context, const mainScreen());

                    }else if(state is InfoFailure){

                      showTopSnackBar(Overlay.of(context),
                          mySnackBar.error(message: state.errormessage)
                      );

                    }
                  },

                  builder: (context, state) {

                    if(state is InfoLoading){
                      return const Center(
                        child: CircularProgressIndicator(color: myColors.blu,),
                      );

                    }else{

                      return confirmButton(
                          ontap: ()async {
                            if(InfoCubit.PIN == InfoCubit.ConfirmPIN){
                              await LocalAuthCubit.authenticate(context);
                              if(LocalAuthCubit.authenticated){
                                BlocProvider.of<InfoCubit>(context).uploadInfo();
                              }else{
                                showTopSnackBar(Overlay.of(context),
                                    const mySnackBar.error(message: "Not secure")
                                );
                              }
                            }else{
                              showTopSnackBar(Overlay.of(context),
                                  const mySnackBar.error(message: "Does not match")
                              );
                            }
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
