import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3FBCB1),
        body: Center(
            child: ProfilePage()
        )
    );
  }
}
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5, // Half the screen height
          color: Color(0xFF3FBCB1), // Background color for the top half
          child: Stack(
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60, // Adjust the radius as needed
                      backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your profile image
                    ),
                    SizedBox(height: 30,),
                    Text("Anish",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Positioned(
                top: 10, // Adjust the top position as needed
                right: 10, // Adjust the right position as needed
                child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5, // Half the screen height
          decoration: const BoxDecoration(
            color: Colors.white, // Background color for the bottom half
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), // Top-left cornered radius
              topRight: Radius.circular(30.0), // Top-right cornered radius
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 25,),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("FAQs",style: TextStyle(fontSize: 25),),
                  trailing: IconButton(
                      icon : Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: (){},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE8F3F1), width: 1.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.warning_rounded),
                  title: Text("Logout",style: TextStyle(fontSize: 25),),
                  trailing: IconButton(
                    icon : Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: (){},
                  ),
                ),
              ],
            )
          ),
        ),
      ],
    );
  }
}