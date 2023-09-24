import 'package:codefury/Service/ApiService.dart';
import 'package:codefury/components/DataBloc.dart';
import 'package:codefury/pages/authSelection.dart';
import 'package:codefury/pages/chat.dart';
import 'package:codefury/pages/home.dart';
import 'package:codefury/pages/loginPage.dart';
import 'package:codefury/pages/meditation.dart';
import 'package:codefury/pages/profilePage.dart';
import 'package:codefury/pages/signinPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget{
  const MentalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),

    );
  }

}


// BlocProvider(
// create: (context) => DataBloc(ApiService(Dio())),
// child: home(),