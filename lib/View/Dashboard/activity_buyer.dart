import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar_buyer.dart';
import 'package:meeter/Widgets/HWidgets/recent_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyerActivityScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> acceptedDemandsCollection;
  BuyerActivityScreen({this.acceptedDemandsCollection});
  @override
  _BuyerActivityScreenState createState() => _BuyerActivityScreenState();
}

class _BuyerActivityScreenState extends State<BuyerActivityScreen> {
  bool recent = true;
  bool upcomming = false;
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
            child: Column(
              children: [
                SizedBox(
                  height: h * 16.8,
                ),
                Container(
                  height: h * 67.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    border: Border.all(
                      width: w * 0.2,
                      color: Colors.green,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 1.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: recent == true
                                      ? Border(
                                          bottom: BorderSide(
                                            color: Colors.green,
                                            width: w * 0.4,
                                          ),
                                        )
                                      : null,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 2.4, vertical: h * 1.1),
                                  child: Text(
                                    "Recent",
                                    style: TextStyle(
                                      fontSize: w * 6.0,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  recent = true;
                                  upcomming = false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: upcomming == true
                                      ? Border(
                                          bottom: BorderSide(
                                            color: Colors.green,
                                            width: w * 0.4,
                                          ),
                                        )
                                      : null,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 2.4, vertical: h * 1.1),
                                  child: Text(
                                    "Upcoming ",
                                    style: TextStyle(
                                      fontSize: w * 6.0,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  recent = false;
                                  upcomming = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: h * 2.2,
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.5,
                      ),
                      RecentData(
                        clr: Colors.green,
                        acceptedDemandsCollection:
                            widget.acceptedDemandsCollection,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 8.9,
                ),
              ],
            ),
          ),
          MeeterAppbarBuyer(
            title: "Activity",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}