import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Providers/register_validation.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/nunito_text.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:meeter/Widgets/TextWidgets/rounded_textfield.dart';
import 'package:meeter/Widgets/progressBtn/flutter_progress_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:meeter/View/Auth/login.dart';
import 'package:meeter/View/Auth/linkPhone.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneController = new TextEditingController();

  TextEditingController usernameController = new TextEditingController();

  TextEditingController passController = new TextEditingController();

  TextEditingController passConfirmController = new TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    RegisterValidation validationService =
        Provider.of<RegisterValidation>(context);

    UserController _currentUser =
        Provider.of<UserController>(context, listen: false);

    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     width: 150,
                        //     padding: EdgeInsets.all(20),
                        //     child: Image.asset("assets/images/Logo@2x.png"),
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: PoppinsText(
                              text: "SIGN UP",
                              align: TextAlign.center,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              clr: Color(0xff00AEFF),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: RoundedTextField(
                                  hint: "Enter your phone number",
                                  type: TextInputType.phone,
                                  obsecureText: false,
                                  icon: Icon(Icons.lock),
                                  iconColor: Colors.cyan,
                                  label: "Phone Number",
                                  controller: passController,
                                  onChange: (text) {
                                    validationService.changePassword(text);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          child: Hero(
                            tag: "Register",
                            child: GradientButton(
                              title: "Sign Up",
                              clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                              onpressed: () async {
                                          
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    child: PhoneWithEmail(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PoppinsText(
                              text: "By signing up you agree to our ",
                              clr: Colors.grey,
                              fontSize: 10,
                            ),
                            PoppinsText(
                              text: "Privacy Policy and Terms",
                              clr: Color(0xff00AEFF),
                              fontSize: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child: Divider(
                                thickness: 1,
                                color: Color(0xff00AEFF),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PoppinsText(
                              text: "OR",
                              clr: Color(0xff00AEFF),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              child: Divider(
                                thickness: 1,
                                color: Color(0xff00AEFF),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PoppinsText(
                              text: "Already Registered? ",
                              clr: Colors.grey,
                              fontSize: 12,
                            ),
                            GestureDetector(
                              child: PoppinsText(
                                text: "Log In",
                                clr: Color(0xff00AEFF),
                                fontSize: 12,
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    child: Login(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
