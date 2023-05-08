import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/code_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class emailFill extends StatelessWidget {
  final title;
  bool reset;
  emailFill({Key? key, required this.title, required this.reset}) : super(key: key);



  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myApplication.keyboardFocus(context),
      child: WillPopScope(
        onWillPop: (){
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: myApplication.backIcon(context,(){})
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
                      Form(
                        key: formkey,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Email';
                            } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                              return 'Enter Valid Email';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          style: Theme.of(context).textTheme.bodySmall,
                          onChanged: (val){
                            SignUpCubit.email = val;
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(75),
                                borderSide: BorderSide(
                                  color: myColors.blu.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(75)
                              ),
                              labelText: "Email",
                          ),
                        ),
                      ),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return Expanded(
                            child: Column(
                              children: [
                                Spacer(),
                                    confirmButton(
                                    ontap: () {
                                      if(formkey.currentState!.validate()){
                                        showTopSnackBar(
                                          Overlay.of(context),
                                          mySnackBar.success(
                                              message: "sent" ,));
                                        BlocProvider.of<SignUpCubit>(context).sentVerfication();
                                        myApplication.navigateTo(codeFill(title:
                                        reset
                                            ? Text(
                                          "Forget Password",
                                          style: TextStyle(
                                              fontSize: myApplication.widthClc(24, context),
                                              fontWeight: FontWeight.bold),
                                        )
                                            : Text(
                                              "Please Verify Your Email ",
                                              style: TextStyle(
                                                  fontSize: myApplication.widthClc(24, context),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          reset: reset,
                                        ), context);
                                      }
                                    },
                                    text: reset ? "send" : "Continue",),
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
