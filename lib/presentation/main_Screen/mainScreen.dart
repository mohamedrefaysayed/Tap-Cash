import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Main Screen",
        ),
      ),
    );
  }
}
