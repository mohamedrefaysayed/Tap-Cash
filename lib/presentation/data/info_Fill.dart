// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:tap_cash/presentation/data/creat_PIN.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class infoFill extends StatelessWidget {
  infoFill({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () => myApplication.keyboardFocus(context),

      child: Scaffold(

        appBar: AppBar(leading: myApplication.backIcon(context, () {})),

        body: Container(

          margin: const EdgeInsets.all(20),

          child: ListView(

            children: [

              const Text(
                "Fill Your Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              SizedBox(
                height: myApplication.hightClc(24, context),
              ),

              const Text("You Can Change It Later", style: TextStyle(fontSize: 14)),

              SizedBox(
                height: myApplication.hightClc(42, context),
              ),

              Stack(

                children: [

                  Center(

                    child: Container(

                      height: myApplication.hightClc(130, context),
                      width: myApplication.widthClc(130, context),

                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),

                      child: BlocBuilder<InfoCubit, InfoState>(
                        builder: (context, state) {
                          return Container(
                            child: InfoCubit.image == null
                                ?  Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: myApplication.widthClc(100, context),
                                  )

                                : ClipOval(
                                    child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.file(InfoCubit.image!),
                                  )),

                          );

                        },
                      ),
                    ),
                  ),
                  Positioned(

                      left: myApplication.widthClc(200, context),
                      top: myApplication.hightClc(90, context),

                      child: GestureDetector(

                        onTap: () => myApplication.imageDialog(context),

                        child: Container(

                          width: myApplication.widthClc(35, context),
                          height: myApplication.hightClc(35, context),

                          decoration: BoxDecoration(

                              boxShadow: [

                                BoxShadow(
                                  color: myColors.shadow,
                                  blurRadius: 10,
                                  offset: const Offset(1, 1.5),
                                  spreadRadius: 10,
                                )

                              ],

                              color: Theme.of(context).dialogBackgroundColor,

                              shape: BoxShape.circle
                          ),

                          child: const Icon(
                            Icons.edit,
                            color: myColors.blu,
                            size: 20,
                          ),

                        ),
                      )),
                ],
              ),

              SizedBox(
                height: myApplication.hightClc(83, context),
              ),

              Form(

                key: formkey,

                child: Column(

                  children: [

                    TextFormField(

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Full Name';
                        } else if (value.length < 10) {
                          return 'Enter a valid Name';
                        } else {
                          return null;
                        }
                      },

                      keyboardType: TextInputType.name,

                      style: Theme.of(context).textTheme.bodySmall,

                      onChanged: (val) {
                        InfoCubit.fullName = val;
                      },

                      decoration: InputDecoration(

                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(75),

                          borderSide: BorderSide(
                            color: myColors.blu.withOpacity(0.3),
                            width: 2,
                          ),

                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75)),
                        labelText: "Full Name",
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(25, context),
                    ),

                    TextFormField(

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Nickname';
                        } else if (value.length < 5) {
                          return 'Enter a valid Nickname';
                        } else {
                          return null;
                        }
                      },

                      keyboardType: TextInputType.name,

                      style: Theme.of(context).textTheme.bodySmall,

                      onChanged: (val) {
                        InfoCubit.nickName = val;
                      },

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(75),
                          borderSide: BorderSide(
                            color: myColors.blu.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75)),
                        labelText: "Nickname",
                      ),

                    ),
                  ],
                ),
              ),

              SizedBox(
                height: myApplication.hightClc(150, context),
              ),

              BlocConsumer<InfoCubit, InfoState>(
                listener: (context,state){

                  if(state is InfoSuccess){

                    showTopSnackBar(Overlay.of(context), const mySnackBar.success(message: "Saved Successfully"));

                    myApplication.navigateTo(const creatPIN(), context);

                  }
                },

                builder: (context, state) {

                  if(state is InfoLoading){

                    return const Center(
                      child: CircularProgressIndicator(color: myColors.blu,),
                    );

                  }else{

                    return confirmButton(
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<InfoCubit>(context).saveInfo();
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
    );
  }
}
