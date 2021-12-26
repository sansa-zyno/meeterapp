/*import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/View/Explore_Seller/unused_folder/achievement_screen.dart';

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
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
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // height: h * 19.1,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 2.4,
                            vertical: h * 1.1,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(120.0),
                            ),
                            height: 120,
                            width: 120,
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
                                    Icon(
                                      Icons.security,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: w * 1.2),
                                    Text(
                                      "Mary Stroganoff",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: w * 5.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Date Meet : 31 December, 2021',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontSize: w * 3.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Total Connections : 5000',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontSize: w * 3.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Total Achievements : 10000',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontSize: w * 3.5,
                                    color: Colors.grey,
                                  ),
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
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: w * 0.4,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 2.4, vertical: h * 1.1),
                                child: Text(
                                  "Conntections",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: w * 6.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 2.4, vertical: h * 1.1),
                                child: Text(
                                  "Achievements",
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
                                  builder: (context) => AchievementScreen(),
                                ),
                              );
                            },
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
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 2.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  height: h * 8.9,
                                  width: w * 19.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: h * 1.1),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              height: h * 8.9,
                              width: w * 19.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              height: h * 8.9,
                              width: w * 19.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              height: h * 8.9,
                              width: w * 19.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 2.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              height: h * 8.9,
                              width: w * 19.5,
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
            title: "Connection",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}*/
