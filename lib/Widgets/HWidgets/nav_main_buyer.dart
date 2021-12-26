import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Dashboard/activity_buyer.dart';
import 'package:meeter/View/Explore_Buyer/home_buyer_screen.dart';
import 'package:meeter/View/Discover/seller_discover.dart';
import 'package:meeter/View/Profile/profile_preview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:meeter/View/Profile/meet_setup.dart';
import 'package:meeter/View/Profile/demand_setup.dart';

class BuyerBottomNavBar extends StatefulWidget {
  @override
  _BuyerBottomNavBarState createState() => _BuyerBottomNavBarState();
}

class _BuyerBottomNavBarState extends State<BuyerBottomNavBar> {
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
      HomeBuyerScreen(),
      SellerDiscover(),
      BuyerActivityScreen(acceptedDemandsCollection: acceptedDemandsCollection),
      ProfilePreview(),
    ];
    return Scaffold(
      extendBody: true,
      /* bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 56,
        items: <Widget>[
          Icon(
            Icons.explore_outlined,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screen[selectedIndex],*/
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.green, Colors.green, Colors.green],
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.green,
            //titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            //activeTitleStyle: TextStyle( color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                color: Colors.green,
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
