import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:provider/provider.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonProblems extends StatefulWidget {
  _CommonProblemsState createState() => _CommonProblemsState();
}

class _CommonProblemsState extends State<CommonProblems> {
  UserController _currentUser;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    _currentUser = Provider.of<UserController>(context);

    OurUser myUser;
    setState(() {
      myUser = _currentUser.getCurrentUser;
    });

    print(_currentUser.getCurrentUser.uid);

    Future<void> _makePhoneCall(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("ProblemDynamic")
                  .doc("dynamic")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  var data = snapshot.data.data();
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: PoppinsText(
                            text: "${data["text1"]}",
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            clr: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: PoppinsText(
                              text: "${data["text2"]}",
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              clr: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff00AEFF),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Color(0xff00AEFF),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 30,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child: PoppinsText(
                                      text: "${data["title1"]}",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      clr: Colors.black,
                                      align: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff00AEFF),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Color(0xff00AEFF),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 30,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child: PoppinsText(
                                      text: "${data["title2"]}",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      clr: Colors.black,
                                      align: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff00AEFF),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Color(0xff00AEFF),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 30,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child: PoppinsText(
                                      text: "${data["title3"]}",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      clr: Colors.black,
                                      align: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 270,
                          height: 50,
                          child: GradientButton(
                            title: "Call Helpline",
                            fontSize: 12,
                            clrs: [Colors.red, Colors.red],
                            onpressed: () async {
                              print(snapshot.data.data()["emergency"]);
                              await _makePhoneCall(
                                  'tel:${snapshot.data.data()["emergency"]}');
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          MeeterAppbar(
            title: "Common Problems",
            icon: Icons.arrow_back_rounded,
          ),
        ],
      ),
    );
  }
}
