import 'package:mental/pages/home.dart';
import 'package:mental/pages/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:mental/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200, // Set your desired width
        height: 400, // Set your desired height
        child: Image.asset('images/test.png'),
      )
    ;

  }
}
