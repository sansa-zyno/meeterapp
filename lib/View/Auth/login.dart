import 'package:flutter/material.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:meeter/Widgets/TextWidgets/rounded_textfield.dart';

class Login extends StatefulWidget {
  TextEditingController phone;
  Function onpressed;

  Login({this.onpressed, this.phone});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //LoginValidation validationService = Provider.of<LoginValidation>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(20),
                          child: Image.asset("assets/images/Logo@2x.png"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: PoppinsText(
                            text: "SIGN IN",
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
                                child: Hero(
                                  tag: "Phone",
                                  child: RoundedTextField(
                                    hint: "Enter your credentials",
                                    type: TextInputType.phone,
                                    obsecureText: false,
                                    icon: Icon(Icons.lock),
                                    iconColor: Colors.cyan,
                                    label: "Phone Number",
                                    controller: widget.phone,
                                    onChange: (text) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Flexible(
                      //         child: Container(
                      //           height: 55,
                      //           width: MediaQuery.of(context).size.width * 0.85,
                      //           child: Hero(
                      //             tag: "Pass",
                      //             child: RoundedTextField(
                      //               hint: "Enter your password",
                      //               type: TextInputType.text,
                      //               obsecureText: true,
                      //               icon: Icon(Icons.lock),
                      //               iconColor: Colors.cyan,
                      //               label: "Password",
                      //               controller: passController,
                      //               onChange: (text) {
                      //                 validationService.changePassword(text);
                      //               },
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      // ),

                      Container(
                        width: 250,
                        height: 50,
                        child: Hero(
                          tag: "Login",
                          child: GradientButton(
                              title: "Sign in",
                              clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                              onpressed: widget.onpressed),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       width: 100,
                      //       child: Divider(
                      //         thickness: 1,
                      //         color: Color(0xff00AEFF),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     PoppinsText(
                      //       text: "OR",
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Container(
                      //       width: 100,
                      //       child: Divider(
                      //         thickness: 1,
                      //         color: Color(0xff00AEFF),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 35,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: Hero(
                      //     tag: "Phone",
                      //     child: GradientButton(
                      //       title: "Sign in with Phone",
                      //       clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //       onpressed: () {
                      //         Navigator.pushReplacement(
                      //           context,
                      //           PageTransition(
                      //             type: PageTransitionType.rightToLeft,
                      //             duration: Duration(milliseconds: 200),
                      //             curve: Curves.easeIn,
                      //             child: null,
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         width: 50,
                      //         height: 50,
                      //         child: Image.asset("assets/images/Facebook.png"),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         width: 50,
                      //         height: 50,
                      //         child: Image.asset("assets/images/Twitter.png"),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         width: 50,
                      //         height: 50,
                      //         child: Image.asset("assets/images/Google.png"),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         width: 50,
                      //         height: 50,
                      //         child: Image.asset("assets/images/Apple.png"),
                      //       ),
                      //     )
                      //   ],
                      // ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     PoppinsText(
                      //       text: "Don't have an account? ",
                      //       clr: Colors.grey,
                      //       fontSize: 12,
                      //     ),
                      //     GestureDetector(
                      //       child: PoppinsText(
                      //         text: "Register",
                      //         clr: Color(0xff00AEFF),
                      //         fontSize: 12,
                      //       ),
                      //       onTap: (){
                      //         Navigator.pushReplacement(
                      //           context,
                      //           PageTransition(
                      //             type: PageTransitionType.rightToLeft,
                      //             duration: Duration(milliseconds: 200),
                      //             curve: Curves.easeIn,
                      //             child: Register(),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
