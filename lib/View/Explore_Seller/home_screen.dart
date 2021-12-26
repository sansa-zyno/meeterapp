import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/View/Explore_Seller/search_result_screen.dart';
import 'package:meeter/View/Explore_Seller/search_screen.dart';
import 'package:meeter/Widgets/HWidgets/mainlists.dart';
import 'package:meeter/Widgets/HWidgets/menu.dart';
import 'package:meeter/Widgets/HWidgets/upcomingMeetings.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_buyer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 2;

  List<QueryDocumentSnapshot> meetersCollection = [];
  List<QueryDocumentSnapshot> acceptedDemandsCollection = [];
  TextEditingController searchController = TextEditingController();

  getMeeterCollection() {
    FirebaseFirestore.instance
        .collection('meeters')
        .snapshots()
        .listen((event) {
      List<String> uids = [];
      for (int i = 0; i < event.docs.length; i++) {
        uids.add(event.docs[i].id);
      }
      print(" hassan uids $uids");
      for (int i = 0; i < uids.length; i++) {
        FirebaseFirestore.instance
            .collection('meeters')
            .doc(uids[i])
            .collection('meeter')
            .snapshots()
            .listen((event) {
          for (int i = 0; i < event.docs.length; i++) {
            meetersCollection.add(event.docs[i]);
            setState(() {});
          }
        });
      }
      print("hassan meeters ${meetersCollection.length.toString()}");
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;

    UserController _currentUser = Provider.of<UserController>(context);
    OurUser currentUser = _currentUser.getCurrentUser;
    /*const items = <Widget>[
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
      ProfilePreview(),
    ];*/

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      key: _scaffoldKey,
      drawer: Menu(
        clr: Colors.blue,
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
                    color: Colors.blue,
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
                                      color: Colors.blue,
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
                                            child: BuyerBottomNavBar(),
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
                                            color: Colors.blue,
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
                        currentUser != null
                            ? Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 4.8, vertical: h * 2.2),
                                    child: currentUser.displayName != null
                                        ? Text(
                                            'Welcome Back \n${currentUser.displayName}!',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 7.3,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              )
                            : Container(),
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
                                        .collection('meeters')
                                        .get();
                                    List<String> uids = [];
                                    for (int i = 0; i < docs.docs.length; i++) {
                                      uids.add(docs.docs[i].id);
                                    }

                                    for (int i = 0; i < uids.length; i++) {
                                      QuerySnapshot docs =
                                          await FirebaseFirestore.instance
                                              .collection('meeters')
                                              .doc(uids[i])
                                              .collection('meeter')
                                              .where('meetup_tags',
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
                                                    SearchResultScreen(
                                                      ldoc: searchCollection,
                                                    )))
                                        : {};
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
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
                                            builder: (context) => SearchScreen(
                                                searchController.text),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.blue,
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
                          clr: Colors.blue,
                          clr1: Colors.blue,
                          acceptedDemandsCollection: acceptedDemandsCollection,
                        ),
                      )
                    : Container(),
                Container(
                  height: 232,
                  color: Colors.blue,
                  child: MainLists(
                    mainText: 'FEATURED SERVICES',
                    meetersCollection: meetersCollection,
                    /*.where((element) => element.get('meetup_likes') >= 10)
                        .toList(),*/
                    clr: Colors.blue,
                    clr1: Colors.blue,
                  ),
                ),
                Container(
                  height: 240,
                  child: MainLists(
                    mainText: 'SUGGESTED SERVICES FOR YOU',
                    meetersCollection: meetersCollection,
                    clr: Colors.blue,
                    clr1: Colors.blue,
                  ),
                ),
                Container(
                  height: 232,
                  child: MainLists(
                    mainText: 'SERVICES NEAR YOU',
                    meetersCollection: meetersCollection,
                    clr: Colors.blue,
                    clr1: Colors.blue,
                  ),
                ),
                Container(
                  height: 232,
                  child: MainLists(
                    mainText: 'HIGH-VALUE SERVICES',
                    meetersCollection: meetersCollection,
                    clr: Colors.blue,
                    clr1: Colors.blue,
                  ),
                ),
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
