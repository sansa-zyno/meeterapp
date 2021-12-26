/*import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import '../home_screen.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  bool positive = true;
  bool neutral = false;
  bool negative = false;
  TextEditingController btn1 = new TextEditingController();
  TextEditingController btn2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 17.9,
                  ),
                  Text(
                    'How do you rate Eshan?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: w * 5.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: w * 4.8,
                  ),
                  Container(
                    width: w * 19.5,
                    height: h * 8.9,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: w * 4.8,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: w * 19.5,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.star_border_outlined,
                  //         color: Color(0xffFFD632),
                  //         size: w * 12.1,
                  //       ),
                  //       Icon(
                  //         Icons.star_border_outlined,
                  //         color: Color(0xffFFD632),
                  //         size: w * 12.1,
                  //       ),
                  //       Icon(
                  //         Icons.star_border_outlined,
                  //         color: Color(0xffFFD632),
                  //         size: w * 12.1,
                  //       ),
                  //       Icon(
                  //         Icons.star_border_outlined,
                  //         color: Color(0xffFFD632),
                  //         size: w * 12.1,
                  //       ),
                  //       Icon(
                  //         Icons.star_border_outlined,
                  //         color: Color(0xffFFD632),
                  //         size: w * 12.1,
                  //       ),
                  //     ],
                  //   ),
                  // ),        
                  // SizedBox(
                  //   height: w * 4.8,
                  // ),
                  Container(
                    height: h * 5.6,
                    width: w * 85.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      border: Border.all(
                        width: w * 0.2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text(
                            'Positive',
                            style: TextStyle(
                              fontSize: w * 4.3,
                              color: positive ? Colors.blue : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              positive = true;
                              neutral = false;
                              negative = false;
                            });
                          },
                        ),
                        VerticalDivider(
                          color: Colors.blue,
                          width: w * 4.8,
                        ),
                        TextButton(
                          child: Text(
                            'Neutral',
                            style: TextStyle(
                              fontSize: w * 4.8,
                              color: neutral ? Colors.blue : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              positive = false;
                              neutral = true;
                              negative = false;
                            });
                          },
                        ),
                        VerticalDivider(
                          color: Colors.blue,
                          width: w * 4.8,
                        ),
                        TextButton(
                          child: Text(
                            'Negative',
                            style: TextStyle(
                              fontSize: w * 4.3,
                              color: negative ? Colors.blue : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              positive = false;
                              neutral = false;
                              negative = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 15.4,
                    width: w * 85.3,
                    child: TextField(
                      controller: btn1,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: w * 0.4,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: w * 0.2,
                          ),
                        ),
                        hintText:
                            'Great person to talk to! i\ve really learnt so much\nabout living in Singapore and feel more confidernt\nfor the years to come in Singapore.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: w*3.5,
                        ),
                        hintMaxLines: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: w * 4.8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: w * 0.2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: w * 43.9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 1.6, horizontal: w * 2.4),
                                child: Text(
                                  'Great buyer to deal with!',
                                  style: TextStyle(
                                    fontSize: w * 4.3,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            onTap: () {
                              btn1.text = "Great buyer to deal with!";
                            },
                          ),
                        ),
                        SizedBox(
                          width: w * 1.2,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: w * 0.2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: w * 43.9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 1.6, horizontal: w * 2.4),
                                child: Text(
                                  'Friendly and delightful!',
                                  style: TextStyle(
                                    fontSize: w * 4.3,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                btn1.text = "Friendly and delightful!";
                              });
                              
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 4.4,
                  ),
                  Container(
                    width: w * 55,
                    height: h * 6.7,
                    child: GradientButton(
                      title: "Submit",
                      fontSize: w * 4.3,
                      clrs: [Colors.blue, Colors.blue],
                      onpressed: () {
                        Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: HomeScreen(),
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          MeeterAppbar(
            title: "Feedback",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}*/
