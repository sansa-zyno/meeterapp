/*import 'package:flutter/material.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_seller.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_buyer.dart';
import 'package:meeter/View/Settings/settings.dart';
import 'package:meeter/View/Explore_Seller/physical_offer_screen.dart';
import 'package:meeter/View/Dashboard/activity.dart';
import 'package:meeter/View/Explore_Seller/connection_screen.dart';
import 'package:meeter/View/Explore_Seller/achievement_screen.dart';
import 'package:meeter/View/Explore_Seller/chat_screen.dart';
import 'package:meeter/View/Explore_Seller/request_offer_screen.dart';
import 'package:meeter/View/Explore_Seller/online_offer_screen.dart';
import 'package:meeter/View/Explore_Seller/meeting_details_screen.dart';
import 'package:meeter/View/Explore_Seller/meeting_progress_screen.dart';
import 'package:meeter/View/Explore_Seller/feedback_screen.dart';
import 'package:meeter/View/Explore_Seller/calendar_screen.dart';
import 'package:meeter/View/Explore_Seller/search_result_screen.dart';
import '../Discover/common_problem.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
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
                            text: "MEETER MILESTONE 3 DEMO",
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
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Home Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: BottomNavBar(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Buyer Mode Screen",
                          clrs: [Color(0xff2fbf00), Color(0xff2fbf00)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: BuyerBottomNavBar(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Search Result Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: SearchResultScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Achievement Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: AchievementScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Connection Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: ConnectionScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Activity Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: ActivityScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Settings Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: Settings(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Chat Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: ChatScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      /*Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Detail Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: DetailsScreen(),
                              ),
                            );
                          },
                        ),
                      ),*/
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Request Offer Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: RequestOffer(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Physical Offer Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: PhysicalOffer(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Online Offer Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: OnlineOffer(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Meeting Details Screen",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: MeetingDetails(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Meeting Progress ",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: MeetingInProgress(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Feedback Screen ",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: FeedBackScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Calendar ",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: CalendarScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 60.9,
                        height: h * 5.6,
                        child: GradientButton(
                          title: "Common Problems ",
                          clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                          onpressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: CommonProblems(),
                              ),
                            );
                          },
                        ),
                      ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Login Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: Login(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Register Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: Register(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Verification Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: Verification(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Success Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: VerificationSuccess(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Settings Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: Settings(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Profile Setup Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: ProfileSetup(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Meet Setup Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: MeetSetup(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "About you Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: YouSetup(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Interest Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: LoveSetup(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Selling Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: InterestedSelling(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Discover Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: Discover(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Discover 2 Page",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: DiscoverInterested(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Interested Seller",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: InterestedSellers(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Profile Preview",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: ProfilePreview(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: 250,
                      //   height: 50,
                      //   child: GradientButton(
                      //     title: "Profile About",
                      //     clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      //     onpressed: () {
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.rightToLeft,
                      //           duration: Duration(milliseconds: 200),
                      //           curve: Curves.easeIn,
                      //           child: ProfileAbout(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
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
}*/
