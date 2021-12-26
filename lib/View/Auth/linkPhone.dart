import 'package:flutter/material.dart';
import 'package:meeter/View/Auth/register.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meeter/Widgets/TextWidgets/rounded_textfield.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:meeter/Providers/login_validation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'verification.dart';

class PhoneWithEmail extends StatelessWidget {
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginValidation validationService = Provider.of<LoginValidation>(context);

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
                            text: "VERIFY YOUR PHONE",
                            align: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
                        height: 50,
                      ),
                      
                      Container(
                        width: 250,
                        height: 50,
                        child: GradientButton(
                          title: "Send Code",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: Verification(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      
                      SizedBox(
                        height: 55,
                      ),
                      Align(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 10,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      )
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
