import 'package:firebase_core/firebase_core.dart';
import 'package:mental/Service/ApiService.dart';
import 'package:mental/components/DataBloc.dart';
import 'package:mental/firebase_options.dart';
import 'package:mental/pages/authSelection.dart';
import 'package:mental/pages/chat.dart';
import 'package:mental/pages/home.dart';
import 'package:mental/pages/loginPage.dart';
import 'package:mental/pages/meditation.dart';
import 'package:mental/pages/profilePage.dart';
import 'package:mental/pages/signinPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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


// BlocProvider(
// create: (context) => DataBloc(ApiService(Dio())),
// child: home(),