import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Model/demand_data.dart';
import 'package:meeter/providers/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Widgets/HWidgets/detail_data.dart';
import 'package:meeter/Widgets/HWidgets/detail_appbar_buyer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailsBuyerScreen extends StatefulWidget {
  final DemandData demands;
  DetailsBuyerScreen(this.demands);
  @override
  _DetailsBuyerScreenState createState() => _DetailsBuyerScreenState();
}

class _DetailsBuyerScreenState extends State<DetailsBuyerScreen> {
  OurUser demandPerson;
  int likes;
  FirebaseAuth _auth;

  onLoad() async {
    UserController user = UserController();
    print(widget.demands.demand_id);
    demandPerson = await user.getUserInfo(widget.demands.demand_person_uid);
    print(demandPerson.uid);
    FirebaseFirestore.instance
        .collection('demands')
        .doc(demandPerson.uid)
        .collection('demand')
        .doc(widget.demands.demand_id)
        .snapshots()
        .listen((event) {
      likes = event['demand_likes'];
      setState(() {});
    });

    _auth = FirebaseAuth.instance;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onLoad();
  }

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
                DetailsData(
                  bannerImage: widget.demands.demand_bannerImage,
                  titleText: widget.demands.demand_title,
                  priceText: "\$${widget.demands.demand_price}",
                  priceText1: '/ 30 min',
                  timeText: widget.demands.demand_available_online
                      ? "Availabe"
                      : "Not available",
                  likesText: likes ?? 0,
                  // categoryText: 'In Category',
                  detailText: widget.demands.demand_description,
                  location: widget.demands.demand_location,
                ),
              ],
            ),
          ),
          _auth != null
              ? _auth.currentUser.uid != demandPerson.uid
                  ? Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            DetailBarBuyer(widget.demands, demandPerson, likes),
                      ),
                    )
                  : Container()
              : Container()
        ],
      ),
    );
  }
}
