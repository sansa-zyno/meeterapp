/*import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_Seller/unused_folder/connection_screen.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';

class AchievementScreen extends StatefulWidget {
  @override
  _AchievementScreenState createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
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
            child: Column(
              children: [
                SizedBox(
                  height: h * 16.8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: h * 4.8,
                    horizontal: w * 2.4,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 2.4,
                            vertical: h * 1.1,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(110.0),
                            ),
                            height: h * 12.3,
                            width: w * 26.8,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 3.3, horizontal: w * 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: w * 1.2),
                                    Expanded(
                                      child: Text(
                                        "Meeter commitment",
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          color: Colors.blue,
                                          fontSize: w * 5.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Date unlocked: ',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          fontSize: w * 3.8,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '16 Mar 2021',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          fontSize: w * 3.8,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Description: ',
                                          style: TextStyle(
                                            fontSize: w * 3.8,
                                            color: Colors.blue,
                                          ),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text:
                                                    'Had a meet-up with an entrepreneur tag. Feeling like starting-up!',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    )
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: h * 59.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w * 2.4,
                                  vertical: h * 1.1,
                                ),
                                child: Text(
                                  "Conntections",
                                  style: TextStyle(
                                    fontSize: w * 6.0,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConnectionScreen(),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w * 2.4,
                                  vertical: h * 1.1,
                                ),
                                child: Text(
                                  "Achievements",
                                  style: TextStyle(
                                    fontSize: w * 6.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: h * 2.2,
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: h * 1.1,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 3.9),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(110.0),
                                  ),
                                  height: h * 12.3,
                                  width: w * 26.8,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(110.0),
                                  ),
                                  height: h * 12.3,
                                  width: w * 26.8,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(110.0),
                                  ),
                                  height: h * 12.3,
                                  width: w * 26.8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: h * 2.2),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 3.9),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(110.0),
                              ),
                              height: h * 12.3,
                              width: w * 26.8,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(110.0),
                              ),
                              height: h * 12.3,
                              width: w * 26.8,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(110.0),
                              ),
                              height: h * 12.3,
                              width: w * 26.8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MeeterAppbar(
            title: "Achievements",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}*/
