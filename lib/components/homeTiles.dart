import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:codefury/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({
    Key? key,
    required this.name,
    required this.img,
    required this.press,
  }) : super(key: key);
  final String name, img;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(120),
          height: getProportionateScreenWidth(120),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
            width:  128,
            height:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xFFC5EBE7),
              borderRadius:  BorderRadius.circular(20),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0xFFC5EBE7),
                  offset:  Offset(0, 4),
                  blurRadius:  2,
                ),
              ],
            ),
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Padding(padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(9))),
                Container(
                  width:  85.4,
                  height:  72.55,
                  child:
                  Image.asset(
                    img,
                    width:  85.4,
                    height:  72.55,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  child:
                  Text(
                    name,
                    textAlign:  TextAlign.center,
                    style:  GoogleFonts.inter (
                      fontSize:  18,
                      fontWeight:  FontWeight.w600,
                      color:  Color(0xff1a4844),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      )),
    );
  }
}