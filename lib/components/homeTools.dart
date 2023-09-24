import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:codefury/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class tools extends StatelessWidget {
  const tools({
    Key? key,
    required this.name,
    required this.img,
    required this.color,
    required this.press,
  }): super(key: key);
  final String name, img;
  final int color;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 100,
        padding:  EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        width:  double.infinity,
        decoration:  BoxDecoration (
          color:  Color(color),
          borderRadius:  BorderRadius.circular(11),
        ),
        child:
        Row(
          children:  [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  name,
                  style:  GoogleFonts.montserrat (
                    fontSize:  20,
                    fontWeight:  FontWeight.w600,
                    color:  Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              width:  32.07,
              height:  37,
              child:
              Image.asset(
                img,
                width:  37,
                height:  37,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
