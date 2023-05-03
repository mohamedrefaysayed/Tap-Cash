import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/info/info_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/MyColors.dart';
import 'package:tap_cash/helper/widgets/small_Button.dart';

class infoFill extends StatelessWidget {
  const infoFill({Key? key}) : super(key: key);

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
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill Your Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: myApplication.hightClc(24, context),
                ),
                Text("You Can Change It Later", style: TextStyle(fontSize: 14)),
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
                                  ? Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                      size: 100,
                                    )
                                  : ClipOval(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.file(InfoCubit.image!),
                                  )

                              ),

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
                                    offset: Offset(1, 1.5),
                                    spreadRadius: 10,
                                  )
                                ],
                                color: Theme.of(context).dialogBackgroundColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: myColors.blu,
                              size: 20,
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallButton(
                      ontap: () {},
                      text: "Skip",
                      color: myColors.softblu,
                      textcolor: myColors.blu,
                    ),
                    smallButton(
                      ontap: () {},
                      text: "Next",
                      color: myColors.blu,
                      textcolor: Theme.of(context).textTheme.labelSmall!.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: myApplication.hightClc(30, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
