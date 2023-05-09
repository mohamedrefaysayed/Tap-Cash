import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/email_Fill.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class idFill extends StatelessWidget {
  idFill({Key? key}) : super(key: key);



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
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter Your ID Number",
                  style: TextStyle(
                      fontSize: myApplication.widthClc(24, context),
                      fontWeight: FontWeight.bold),),                SizedBox(
                  height: myApplication.hightClc(170, context),
                ),
                Form(
                  key: formkey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your ID Number';
                      } else if (value.length!=14) {
                        return 'Enter Valid ID Number';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: Theme.of(context).textTheme.bodySmall,
                    onChanged: (val){
                      SignUpCubit.Id = val;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(75),
                        borderSide: BorderSide(
                          color: myColors.blu.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(75)
                      ),
                      labelText: "ID",
                    ),
                  ),
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          confirmButton(
                            ontap: () {
                              if(formkey.currentState!.validate()){
                                myApplication.navigateTo(
                                    emailFill(title:
                                    Text("Sign Up With Your Email",
                                      style: TextStyle(
                                          fontSize: myApplication.widthClc(24, context),
                                          fontWeight: FontWeight.bold),), reset: false,),
                                    context);                              }
                            },
                            text:"Continue"),
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
