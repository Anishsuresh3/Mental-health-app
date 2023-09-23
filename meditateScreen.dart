import 'package:flutter/material.dart';


class meditateScreen extends StatefulWidget {
  const meditateScreen({Key? key}) : super(key: key);

  @override
  State<meditateScreen> createState() => _meditateScreenState();
}

class _meditateScreenState extends State<meditateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          Row(
          children: [
            SizedBox(width: 40,),
            Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  height: 200,
                  width: 150,
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
                            padding: EdgeInsets.only(left:1,bottom: 20),
                            child: Text("Anxiety\nRelease",style: TextStyle(fontSize: 20),),
                          ),
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
                SizedBox(height: 8,),
                Container(
                  height: 200,
                  width: 150,
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
                            padding: EdgeInsets.only(left:1,bottom: 20),
                            child: Text("Ease\nDiscomfort",style: TextStyle(fontSize: 20),),
                          ),
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
                )
              ],
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 150,
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
                            padding: EdgeInsets.only(left:5,bottom: 20),
                            child: Text("Easing\nDepression",style: TextStyle(fontSize: 19),),
                          ),
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
                SizedBox(height: 8,),
                Container(
                  height: 200,
                  width: 150,
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
                            padding: EdgeInsets.only(left:1,bottom: 20),
                            child: Text("Refine\nYourself",style: TextStyle(fontSize: 20),),
                          ),
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
                )
              ],
            )
          ],
        ),
        ]
      ),
    );
  }
}
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90.0,
      elevation: 0,
      backgroundColor: Colors.white, // White background
      leading: IconButton(
        icon: ImageIcon(AssetImage('images/back_button.png'),size: 48,), // Back icon on the left
        onPressed: () {
          // Handle back button action here

        },
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Meditate',
            style: TextStyle(fontSize:22.0,color: Color(0xFFA9BDBC)), // Set text color to black
            ), // Title text
          SizedBox(width: 36.0), // Adjust the width as needed
        ],
      ),
    );
  }
}
