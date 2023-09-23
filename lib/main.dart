import 'package:codefury/pages/authSelection.dart';
import 'package:codefury/pages/loginPage.dart';
import 'package:codefury/pages/signinPage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget{
  const MentalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: authSelection(),
    );
  }

}