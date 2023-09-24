import 'package:codefury/pages/meditationComponents/anxietyRelease.dart';
import 'package:codefury/pages/meditationComponents/easeDiscomfort.dart';
import 'package:codefury/pages/meditationComponents/easingDepression.dart';
import 'package:codefury/pages/meditationComponents/refineYourself.dart';
import 'package:codefury/screenComponents/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  class meditateScreen extends StatefulWidget {
  const meditateScreen({Key? key}) : super(key: key);

  @override
  State<meditateScreen> createState() => _meditateScreenState();
}

class _meditateScreenState extends State<meditateScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      size: 30.0,
                      Icons.arrow_back_ios_rounded,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Center(
                        child: Text(
                          'Meditation',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff101522),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 40,),
                            GestureDetector(
                              onTap: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AnxietyRelease()),
                              );},
                              child: Container(
                                  height: 200,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7E2CD), // Background color
                                    borderRadius: BorderRadius.circular(20.0), // Set the corner radius
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left:13,bottom: 20),
                                          child: Text("Anxiety\nRelease",style: TextStyle(fontSize: 20),),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            child: IconButton(
                                              icon:Icon(Icons.play_circle_fill,size: 30,),
                                              color: Colors.brown,
                                              onPressed: (){},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            GestureDetector(
                              onTap: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EaseDiscomfort()),
                              );},
                              child: Container(
                                  height: 200,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDC9ED), // Background color
                                    borderRadius: BorderRadius.circular(20.0), // Set the corner radius
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left:10,bottom: 20),
                                          child: Text("Ease\nDiscomfort",style: TextStyle(fontSize: 20),),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            child: IconButton(
                                              icon:Icon(Icons.play_circle_fill,size: 30,),
                                              color: Colors.brown,
                                              onPressed: (){

                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: getProportionateScreenHeight(20)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(200)),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EasingDepression()),
                                );
                              },
                              child: Container(
                                  height: 200,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC9CEF8), // Background color
                                    borderRadius: BorderRadius.circular(20.0), // Set the corner radius
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left:13,bottom: 20),
                                          child: Text("Easing\nDepression",style: TextStyle(fontSize: 19),),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            child: IconButton(
                                              icon:Icon(Icons.play_circle_fill,size: 30,),
                                              color: Colors.brown,
                                              onPressed: (){},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RefineYourself()),
                                );
                              },
                              child: Container(
                                  height: 200,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9CDCE), // Background color
                                    borderRadius: BorderRadius.circular(20.0), // Set the corner radius
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left:13,bottom: 20),
                                          child: Text("Refine\nYourself",style: TextStyle(fontSize: 20),),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            child: IconButton(
                                              icon:Icon(Icons.play_circle_fill,size: 30,),
                                              color: Colors.brown,
                                              onPressed: (){},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}