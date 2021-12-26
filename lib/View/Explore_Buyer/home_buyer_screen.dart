import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_Buyer/search_buyer_screen.dart';
import 'package:meeter/View/Explore_Buyer/buyer_search_result_screen.dart';
import 'package:meeter/Widgets/HWidgets/mainlists_buyer.dart';
import 'package:meeter/Widgets/HWidgets/menu.dart';
import 'package:meeter/Widgets/HWidgets/upcomingMeetings.dart';
import 'package:meeter/Widgets/HWidgets/cards.dart';
import 'package:meeter/Widgets/HWidgets/categories.dart';
import 'package:page_transition/page_transition.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_seller.dart';

class HomeBuyerScreen extends StatefulWidget {
  @override
  _HomeBuyerScreenState createState() => _HomeBuyerScreenState();
}

class _HomeBuyerScreenState extends State<HomeBuyerScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 2;
  List<QueryDocumentSnapshot> meeters2Collection = [];
  List<QueryDocumentSnapshot> acceptedDemandsCollection = [];
  TextEditingController searchController = TextEditingController();

  getMeeterCollection() {
    FirebaseFirestore.instance
        .collection('meeters2')
        .snapshots()
        .listen((event) {
      List<String> uids = [];
      for (int i = 0; i < event.docs.length; i++) {
        uids.add(event.docs[i].id);
      }
      print(" hassan uids $uids");
      for (int i = 0; i < uids.length; i++) {
        FirebaseFirestore.instance
            .collection('meeters2')
            .doc(uids[i])
            .collection('meeter2')
            .snapshots()
            .listen((event) {
          for (int i = 0; i < event.docs.length; i++) {
            meeters2Collection.add(event.docs[i]);
            setState(() {});
          }
        });
      }
      print("hassan meeters ${meeters2Collection.length.toString()}");
    });
  }

  getAcceptedDemandCollection() {
    FirebaseFirestore.instance
        .collection('accepted_demands')
        .snapshots()
        .listen((event) {
      List<String> uids = [];
      for (int i = 0; i < event.docs.length; i++) {
        uids.add(event.docs[i].id);
      }
      print(" hassan uids $uids");
      for (int i = 0; i < uids.length; i++) {
        FirebaseFirestore.instance
            .collection('accepted_demands')
            .doc(uids[i])
            .collection('accepted_demand')
            .snapshots()
            .listen((event) {
          for (int i = 0; i < event.docs.length; i++) {
            acceptedDemandsCollection.add(event.docs[i]);
            setState(() {});
          }
        });
      }
      print("hassan demands ${acceptedDemandsCollection.length.toString()}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMeeterCollection();
    getAcceptedDemandCollection();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    /*final items = <Widget>[
      Icon(FontAwesomeIcons.compass, size: 30, color: Colors.white),
      Icon(Icons.search, size: 30, color: Colors.white),
      Icon(Icons.add, size: 30, color: Colors.white),
      Icon(Icons.notifications, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white),
    ];
    
    final screens = <Widget>[
      Discover(),
      Discover(),
      Discover(),
      ActivityScreen(
          recent: true,
          upcoming: false,
          acceptedDemandsCollection: acceptedDemandsCollection),
      ProfileAbout(),
    ];*/
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      key: _scaffoldKey,
      drawer: Menu(
        clr: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 1.9, vertical: h * 0.8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState.openDrawer();
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50 / 2),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: w * 2.4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 200),
                                            curve: Curves.easeIn,
                                            child: BottomNavBar(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50 / 2),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.sync,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 4.8, vertical: h * 2.2),
                                child: Text(
                                  'Welcome Back \nFind a request you can address!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: w * 7.3,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 3.6),
                                child: TextField(
                                  controller: searchController,
                                  onSubmitted: (value) async {
                                    List<DocumentSnapshot> searchCollection =
                                        [];
                                    QuerySnapshot docs = await FirebaseFirestore
                                        .instance
                                        .collection('meeters2')
                                        .get();
                                    List<String> uids = [];
                                    for (int i = 0; i < docs.docs.length; i++) {
                                      uids.add(docs.docs[i].id);
                                    }

                                    for (int i = 0; i < uids.length; i++) {
                                      QuerySnapshot docs =
                                          await FirebaseFirestore.instance
                                              .collection('meeters2')
                                              .doc(uids[i])
                                              .collection('meeter2')
                                              .where('demand_tags',
                                                  arrayContains: value)
                                              .get();
                                      for (int i = 0;
                                          i < docs.docs.length;
                                          i++) {
                                        searchCollection.add(docs.docs[i]);
                                        setState(() {});
                                      }
                                    }

                                    searchCollection.isNotEmpty
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    BuyerSearchResultScreen(
                                                      ldoc: searchCollection,
                                                    )))
                                        : {};
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusColor: Colors.green,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    hintText: 'Search',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SearchBuyerScreen(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 1.12,
                ),
                acceptedDemandsCollection.length != 0
                    ? Container(
                        height: 136,
                        child: UpcomingMeetings(
                          clr: Colors.green,
                          clr1: Colors.green,
                          acceptedDemandsCollection: acceptedDemandsCollection,
                        ),
                      )
                    : Container(),

                // Buyer Mode Screen Cards

                Cards(),
                Categories(),

                meeters2Collection.length != 0
                    ? Container(
                        height: 232,
                        color: Colors.green,
                        child: MainListsBuyer(
                          mainText: 'FEATURED DEMAND',
                          meeters2Collection: meeters2Collection,
                          clr: Colors.green,
                          clr1: Colors.green,
                        ),
                      )
                    : Container(),
                meeters2Collection.length != 0
                    ? Container(
                        height: 232,
                        child: MainListsBuyer(
                          mainText: 'SUGGESTED DEMAND FOR YOU',
                          meeters2Collection: meeters2Collection,
                          clr: Colors.green,
                          clr1: Colors.green,
                        ),
                      )
                    : Container(),
                meeters2Collection.length != 0
                    ? Container(
                        height: 232,
                        child: MainListsBuyer(
                          mainText: 'DEMAND NEAR YOU',
                          meeters2Collection: meeters2Collection,
                          clr: Colors.green,
                          clr1: Colors.green,
                        ),
                      )
                    : Container(),
                meeters2Collection.length != 0
                    ? Container(
                        height: 232,
                        child: MainListsBuyer(
                          mainText: 'HIGH-VALUE DEMAND',
                          meeters2Collection: meeters2Collection,
                          clr: Colors.green,
                          clr1: Colors.green,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: h * 8.9,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
