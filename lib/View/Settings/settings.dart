import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff00AEFF),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 20,
                                  color: Color(0xff00AEFF),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                PoppinsText(
                                  text: "Language",
                                  fontSize: 12,
                                  clr: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: PoppinsText(
                              text: "English",
                              fontSize: 12,
                              clr: Color(
                                0xff00AEFF,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff00AEFF),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  size: 20,
                                  color: Color(0xff00AEFF),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                PoppinsText(
                                  text: "Application Theme",
                                  fontSize: 12,
                                  clr: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: PoppinsText(
                              text: "Light",
                              fontSize: 12,
                              clr: Color(
                                0xff00AEFF,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: PoppinsText(
                        text: "Notifications",
                        fontSize: 20,
                        clr: Color(
                          0xff00AEFF,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff00AEFF),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.notifications_active_outlined,
                                      size: 20,
                                      color: Color(0xff00AEFF),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PoppinsText(
                                      text: "Push Notifications",
                                      fontSize: 12,
                                      clr: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: GFToggle(
                                  enabledThumbColor: Colors.blue,
                                  enabledTrackColor: Colors.blue[200],
                                  onChanged: (val) {},
                                  value: null,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Divider(
                              color: Color(0xff00AEFF),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      size: 20,
                                      color: Color(0xff00AEFF),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PoppinsText(
                                      text: "Email Notifications",
                                      fontSize: 12,
                                      clr: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: GFToggle(
                                  enabledThumbColor: Colors.blue,
                                  enabledTrackColor: Colors.blue[200],
                                  onChanged: (val) {},
                                  value: null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: PoppinsText(
                        text: "App Permissions",
                        fontSize: 20,
                        clr: Color(
                          0xff00AEFF,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff00AEFF),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                      color: Color(0xff00AEFF),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PoppinsText(
                                      text: "Camera",
                                      fontSize: 12,
                                      clr: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: GFToggle(
                                  enabledThumbColor: Colors.blue,
                                  enabledTrackColor: Colors.blue[200],
                                  onChanged: (val) {},
                                  value: null,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Divider(
                              color: Color(0xff00AEFF),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Color(0xff00AEFF),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PoppinsText(
                                      text: "Location",
                                      fontSize: 12,
                                      clr: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: GFToggle(
                                  enabledThumbColor: Colors.blue,
                                  enabledTrackColor: Colors.blue[200],
                                  onChanged: (val) {},
                                  value: null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MeeterAppbar(
            title: "Settings",
            icon: Icons.arrow_back_rounded,
          ),
        ],
      ),
    );
  }
}
