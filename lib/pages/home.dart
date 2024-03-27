import 'package:mental/components/botNavBar.dart';
import 'package:mental/components/homeTiles.dart';
import 'package:mental/components/homeTools.dart';
import 'package:mental/pages/loginPage.dart';
import 'package:mental/pages/meditation.dart';
import 'package:mental/pages/moodJournal.dart';
import 'package:flutter/material.dart';
import 'package:mental/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  home({super.key,required this.name});
  String name;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
            reverse: true,
            child: Center(
                child: Column(children: [
                  Container(
                    height: getProportionateScreenHeight(320),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0), // Adjust the radius as needed.
                      ),
                      color: Color(0xFF3FBCB1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(50),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                },
                                icon: const Icon(
                                  size: 30.0,
                                  Icons.menu_rounded ,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Center(
                                    child: Text(
                                      'Good Morning, ${widget.name}',
                                      style:  GoogleFonts.montserrat (
                                        fontSize:  25,
                                        fontWeight:  FontWeight.w700,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: getProportionateScreenHeight(15),
                        // ),
                        Container(
                          // autogroup8sdhLWb (J8GPeExU7JmjdT4pag8sdh)
                          padding:  EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenHeight(20)
                          ),
                          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            borderRadius:  BorderRadius.circular(20),
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/bannerBg.png'),
                            )
                          ),
                          child:
                          Column(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children:  [
                              Container(
                                width: 25,
                                height: 23,
                                child: Image.asset(
                                  'images/doubleInvertedComma.png', // Provide the correct path to your image
                                  width: 25,
                                  height: 23,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Container(
                                padding:  EdgeInsets.only(
                                    left: getProportionateScreenWidth(30),
                                ),
                                constraints:  BoxConstraints (
                                  maxWidth:  300,
                                ),
                                child:
                                Text(
                                  'a good mood is like a balloon, one little prick is all it takes to ruin it',
                                  style:  GoogleFonts.montserrat (
                                    fontSize:  17,
                                    fontWeight:  FontWeight.w700,
                                    color:  Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        padding:  EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                        ),
                        child:
                        Text(
                          'Recommended for you',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter (
                            fontSize:  22,
                            fontWeight:  FontWeight.w600,
                            height:  1.5,
                            color:  Color(0xff1a4844),
                          ),
                        ),
                      ),
                      // To add Arrow
                    ]),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RecommendedList(
                          name: "Meditate",
                          img: 'images/meditate.png',
                          press: () {
                          },
                        ),
                        RecommendedList(
                          name: "Yoga",
                          img: 'images/yoga.png',
                          press: () {
                            debugPrint("test");
                          },
                        ),
                        RecommendedList(
                          name: "Podcasts",
                          img: 'images/podcasts.png',
                          press: () {},
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          padding:  EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                          ),
                          child:
                          Text(
                            'Tools',
                            textAlign:  TextAlign.center,
                            style:  GoogleFonts.inter (
                              fontSize:  22,
                              fontWeight:  FontWeight.w600,
                              height:  1.5,
                              color:  Color(0xff1a4844),
                            ),
                          ),
                        ),
                        // To add Arrow
                      ]),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  tools(name: 'Mood Journal', img: 'images/moodJournal.png', color: 0xff1c7daa, press: () {
                  },),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  tools(name: 'Mood Boosters', img: 'images/moodBooster.png', color: 0xffffc75a, press: () {  },),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  tools(name: 'Positive Activites', img: 'images/positiveActivites.png', color: 0xff67d6b0, press: () {  },),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),


                ])
            )
        ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
