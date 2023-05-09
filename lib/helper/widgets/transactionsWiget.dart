import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tap_cash/helper/MyApplication.dart';

class notificationsWidget extends StatelessWidget {
  const notificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_){},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        height: myApplication.hightClc(58, context),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(1, 1.5),
              spreadRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipOval(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    "https://yt3.googleusercontent.com/ytc/AGIKgqNARqe1ySQ4HhxtFBmgL0MXOg-b-dps6N90hgO7=s900-c-k-c0x00ffffff-no-rj",
                    height: 45,
                    width: 45,
                  ),
                )),
            SizedBox(width: myApplication.widthClc(14, context),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Osama Sent you transfer",style: TextStyle(fontWeight: FontWeight.w400,fontSize: myApplication.widthClc(14, context)),),
                Text("22 jan 2023",style: TextStyle(fontWeight: FontWeight.w400,fontSize: myApplication.widthClc(12, context),color: Colors.grey),),

              ],
            ),
            SizedBox(width: myApplication.widthClc(14, context),),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("EGP 500",style: TextStyle(fontWeight: FontWeight.w600,fontSize: myApplication.widthClc(14, context)),),
            )
          ],
        ),
      ),
    );
  }
}
