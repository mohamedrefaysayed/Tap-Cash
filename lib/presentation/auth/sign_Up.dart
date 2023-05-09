import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/sign_Up/sign_up_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/auth/id_Fill.dart';
import 'package:tap_cash/presentation/auth/sign_In.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: myApplication.hightClc(130, context),
              ),
              const Text(
                "Logo",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: myApplication.hightClc(165, context),
              ),
              Text(
                "Change your financial",
                style: TextStyle(
                    fontSize: myApplication.widthClc(28, context),
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "future  ",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(28, context),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Join Now",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(28, context),
                        fontWeight: FontWeight.bold,
                        color: myColors.blu),
                  ),
                ],
              ),
              SizedBox(
                height: myApplication.hightClc(27, context),
              ),
              Text(
                "Control of your finances with our secure and ",
                style: TextStyle(fontSize: myApplication.widthClc(12, context)),
              ),
              SizedBox(
                height: myApplication.hightClc(13, context),
              ),
              Text(
                "user-  friendly app ",
                style: TextStyle(fontSize: myApplication.widthClc(12, context)),
              ),
              SizedBox(
                height: myApplication.hightClc(65, context),
              ),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if(state is SignUpSuccess){
                   myApplication.navigateTo(idFill(), context);
                  }else if(state is SignUpFailure){
                    showTopSnackBar(Overlay.of(context),
                        mySnackBar.error(message: state.errormessage)
                    );
                  }
                },
                builder: (context, state) {
                  if(state is SignUpLoading){
                    return const SizedBox(
                      height: 48,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }else{
                    return confirmButton(ontap: () => BlocProvider.of<SignUpCubit>(context).signUpContinue(), text: "Sign Up");
                  }
                },
              ),
              SizedBox(
                height: myApplication.hightClc(32, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already  Have  An  Account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: myApplication.widthClc(14, context)),
                  ),
                  TextButton(
                      onPressed: () => myApplication.navigateTo(signIn(), context),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: myApplication.widthClc(14, context),
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
