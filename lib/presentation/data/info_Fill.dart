import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/confirm_Button.dart';

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
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: BlocBuilder<InfoCubit, InfoState>(
                        builder: (context, state) {
                          return Container(
                            child: InfoCubit.image == null
                                ? const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 100,
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
                      left: 200,
                      top: 90,
                      child: GestureDetector(
                        onTap: () => myApplication.imageDialog(context),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(1, 1.5),
                                  spreadRadius: 10,
                                )
                              ],
                              color: Theme.of(context).dialogBackgroundColor,
                              shape: BoxShape.circle),
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
                      onChanged: (val) {},
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
                      onChanged: (val) {},
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
              BlocBuilder<InfoCubit, InfoState>(
                builder: (context, state) {
                  if(state is InfoLoading){
                    return const Center(
                      child: CircularProgressIndicator(color: myColors.blu,),
                    );
                  }else{
                    return confirmButton(
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<InfoCubit>(context).saveInfo(context);
                            
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
