// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';

class privacyPolicy extends StatelessWidget {
  const privacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => myApplication.keyboardFocus(context),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: myApplication.backIcon(context, () {})),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: myApplication.hightClc(30, context),),

                SizedBox(
                  height: myApplication.hightClc(645, context),
                  width: double.infinity,
                  child: ListView(
                    children: [
                      Text("1. Types of Data We Collect",
                        style: TextStyle(fontSize: myApplication.widthClc(18, context),fontWeight: FontWeight.w600),),
                      SizedBox(height: myApplication.hightClc(15, context),),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(fontSize: myApplication.widthClc(14, context),),),
                      SizedBox(height: myApplication.hightClc(30, context),),
                      Text("2. Use of Your Personal Data",
                        style: TextStyle(fontSize: myApplication.widthClc(18, context),fontWeight: FontWeight.w600),),
                      SizedBox(height: myApplication.hightClc(15, context),),
                      Text("Magna etiam tempor orci eu lobortis elementum nibh. Vulputate enim nulla aliquet porttitor lacus. Orci sagittis eu volutpat odio. Cras semper auctor neque vitae tempus quam pellentesque nec. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Commodo elit at imperdiet dui. Nisi vitae suscipit tellus mauris a diam. Erat pellentesque adipiscing commodo elit at imperdiet dui. Mi ipsum faucibus vitae aliquet nec ullamcorper. Pellentesque pulvinar pellentesque habitant morbi tristique senectus et..",
                        style: TextStyle(fontSize: myApplication.widthClc(14, context),),),
                      SizedBox(height: myApplication.hightClc(30, context),),
                      Text("3. Disclosure of Your Personal Data",
                        style: TextStyle(fontSize: myApplication.widthClc(18, context),fontWeight: FontWeight.w600),),
                      SizedBox(height: myApplication.hightClc(15, context),),
                      Text("Consequat id porta nibh venenatis cras sed. Ipsun nunc aliquet bibendum enin facilisis gravida neque. Nibh tellus molestie nunc non blandit massa. Quam pellentesque nec nam aliquam sen et tortor consequat id. Faucibus vitae aliquet nec ullamcorper sit amet risus. Nunc consequat interdum varius sit amet. Eget magna fermentum iaculis eu non diam phasellus vestibulum. Pulvinar pellentesque habitant morbi tristique senectus et. Lorem donec massa sapien faucibus et molestie. Massa tempor nec feugiat nisl pretiun fusce id. Lacinia at quis risus sed vulputate odio. Integer vitae justo eget magna fermentum iaculis. Eget aravida cum sociis natogue DengtibUs et mnganis",
                        style: TextStyle(fontSize: myApplication.widthClc(14, context),),),




                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
