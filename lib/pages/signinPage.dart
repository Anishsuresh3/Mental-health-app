import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mental/pages/authService.dart';
import 'package:mental/pages/home.dart';
import 'package:mental/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:mental/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class signinpage extends StatefulWidget {
  const signinpage({super.key});

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final db = FirebaseFirestore.instance;
  int valid = -1;

  int validate() {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+}{":;])(?=.{6,})');

    if (nameController.text == "")
      return 0;
    if (!emailRegex.hasMatch(emailController.text))
      return 1;
    if (!passwordRegex.hasMatch(passwordController.text))
      return 2;

    return -1;
  }

  void saveUser() async {
    final message = await AuthService().registration(
      email: emailController.text,
      password: passwordController.text,
    );

    if (message!.contains('Success')) {
      Map<String, dynamic> userData = {
        'UserName': nameController.text,
        'EmailAddress': emailController.text,
      };
      // UserModel aa =UserModel(UserName: userNameController.text, emailAddress: emailController.text, password: passwordController.text, userUid: FirebaseAuth.instance.currentUser!.uid);
      await db.collection("users").add(userData).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => home(name: nameController.text)),
      );
    }
  }


    @override
    Widget build(BuildContext context) {
      SizeConfig().init(context);
      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
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
                                  'Sign Up',
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
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        // Adjust the padding as needed.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // Adjust the radius as needed.
                          border: Border.all(
                            color: const Color(0x7fdedede),
                            width: 2.0, // Adjust the border width as needed.
                          ),
                          color: const Color(0xFFF9F9F9),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                // Adjust the top padding as needed.
                                right: 10.0,
                                // Adjust the right padding as needed.
                                bottom: 8.0,
                                // Adjust the bottom padding as needed.
                                left: 20.0, // Adjust the left padding as needed.
                              ), // Adjust the padding as needed.
                              child: Icon(
                                Icons.account_box_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Remove the default border.
                                    hintText: 'Enter your name',
                                    contentPadding: EdgeInsets.only(left: 20.0),
                                    errorText: valid == 0
                                        ? "Please enter your name"
                                        : null
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        // Adjust the padding as needed.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // Adjust the radius as needed.
                          border: Border.all(
                            color: const Color(0x7fdedede),
                            width: 2.0, // Adjust the border width as needed.
                          ),
                          color: const Color(0xFFF9F9F9),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                // Adjust the top padding as needed.
                                right: 10.0,
                                // Adjust the right padding as needed.
                                bottom: 8.0,
                                // Adjust the bottom padding as needed.
                                left: 20.0, // Adjust the left padding as needed.
                              ), // Adjust the padding as needed.
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Remove the default border.
                                    hintText: 'Enter your Email',
                                    contentPadding: EdgeInsets.only(left: 20.0),
                                    errorText: valid == 1
                                        ? "Please enter correct email"
                                        : null
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // Add any additional properties for the TextField.
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        // Adjust the padding as needed.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // Adjust the radius as needed.
                          border: Border.all(
                            color: const Color(0x7fdedede),
                            width: 2.0, // Adjust the border width as needed.
                          ),
                          color: const Color(0xFFF9F9F9),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                // Adjust the top padding as needed.
                                right: 10.0,
                                // Adjust the right padding as needed.
                                bottom: 8.0,
                                // Adjust the bottom padding as needed.
                                left: 20.0, // Adjust the left padding as needed.
                              ), // Adjust the padding as needed.
                              child: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Remove the default border.
                                    hintText: 'Enter your Password',
                                    contentPadding: EdgeInsets.only(left: 20.0),
                                    errorText: valid == 2
                                        ? "At least of 6 Characters with\nat least one capital,\none number,\none special character"
                                        : null
                                ),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(35),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenWidth(20)),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => home()),
                          // );
                          setState(() {
                            valid = validate();
                            if (valid == -1) {
                              saveUser();
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(18),
                              vertical: getProportionateScreenWidth(15)),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff50aafa),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child:
                          RichText(
                            textAlign: TextAlign.center,
                            text:
                            TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                color: Color(0xff707684),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: Color(0xff707684),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                    letterSpacing: 0.5,
                                    color: Color(0xff50aafa),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          // signupQ6K (19:263)
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child:
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              color: Color(0xff50aafa),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    // const Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal:25),
                    //   child: Row(
                    //     children: const [
                    //       Expanded(
                    //           child: Divider(
                    //             thickness: 0.5,
                    //             color: Colors.brown,
                    //           )
                    //       ),
                    //
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 10),
                    //         child: Text('OR',
                    //           style: TextStyle(color: Colors.blueGrey,fontSize: 18),
                    //         ),
                    //       ),
                    //
                    //       Expanded(
                    //           child: Divider(
                    //             thickness: 0.5,
                    //             color: Colors.brown,
                    //           )
                    //       )
                    //     ],
                    //   ),
                    // ),
                    //
                    // GestureDetector(
                    //   onTap: () {
                    //   },
                    //   child: ClipRRect(
                    //     child: Image.asset(
                    //       'images/googleSignIn.png',
                    //       width: 350,
                    //       height: 100,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ));
    }

}
