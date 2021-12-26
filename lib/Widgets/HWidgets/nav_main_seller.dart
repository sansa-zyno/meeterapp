import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Discover/discover.dart';
import 'package:meeter/View/Explore_Seller/home_screen.dart';
import 'package:meeter/View/Dashboard/activity.dart';
import 'package:meeter/View/Profile/meet_setup.dart';
import 'package:meeter/View/Profile/demand_setup.dart';
import 'package:meeter/View/Profile/profile_preview.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  //GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<QueryDocumentSnapshot> acceptedDemandsCollection = [];
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
    getAcceptedDemandCollection();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    final screen = [
      HomeScreen(),
      Discover(),
      ActivityScreen(acceptedDemandsCollection: acceptedDemandsCollection),
      ProfilePreview(),
    ];

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      /* bottomNavigationBar: NavigationActionBar(
        context: context,
        //scaffoldColor: Colors.blueAccent,
        backgroundColor: Colors.blue,
        accentColor: Colors.blue,
        index: 0,
        subItems: [
          NavBarItem(iconData: Icons.person, size: 25),
          NavBarItem(iconData: Icons.clean_hands_outlined, size: 25),
        ],
        mainIndex: 2,
        items: [
          NavBarItem(iconData: Icons.explore_outlined, size: 35),
          NavBarItem(iconData: Icons.search, size: 35),
          //NavBarItem(iconData: Icons.add, size: 35),
          NavBarItem(iconData: Icons.notifications, size: 35),
          NavBarItem(iconData: Icons.person, size: 35),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index.toInt();
          });
        },
      ),
      body: screen[currentIndex],*/
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.blue, Colors.blue, Colors.blue],
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue,
            //titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            //activeTitleStyle: TextStyle( color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                color: Colors.blue,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                elevation: 2),
            elevation: 2.0,
            items: [
              // Suggested count : 4
              SCBottomBarItem(
                  icon: Icons.explore_outlined,
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.search,
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.notifications,
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.person,
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  }),
            ],
            circleItems: [
              //Suggested Count: 3
              SCItem(
                  icon: Icon(
                    Icons.clean_hands_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MeetSetup()));
                  }),
              SCItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => DemandSetup()));
                  }),
            ],
            bnbHeight: 80 // Suggested Height 80
            ),
        child: screen[currentIndex],
      ),
    );
  }
}
