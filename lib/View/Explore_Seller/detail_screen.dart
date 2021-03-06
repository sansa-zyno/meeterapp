import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/providers/user_controller.dart';
import 'package:meeter/Model/meetup_data.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Widgets/HWidgets/detail_data.dart';
import 'package:meeter/Widgets/HWidgets/detail_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailsScreen extends StatefulWidget {
  final MeetupData meeter;
  DetailsScreen(this.meeter);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  OurUser sellerDetails;
  int likes;
  FirebaseAuth _auth;

  onLoad() async {
    UserController user = UserController();
    print(widget.meeter.meetup_id);
    sellerDetails = await user.getUserInfo(widget.meeter.meetup_seller_uid);
    print(sellerDetails.uid);
    FirebaseFirestore.instance
        .collection('meeters')
        .doc(sellerDetails.uid)
        .collection('meeter')
        .doc(widget.meeter.meetup_id)
        .snapshots()
        .listen((event) {
      likes = event['meetup_likes'];
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
      body: Stack(children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              DetailsData(
                bannerImage: widget.meeter.meetup_bannerImage,
                titleText: widget.meeter.meetup_title,
                priceText: "\$${widget.meeter.meetup_price}",
                priceText1: '/ 30 min',
                timeText: widget.meeter.meetup_available_online
                    ? "Availabe"
                    : "Not available",
                likesText: likes ?? 0,
                // categoryText: 'In Category',
                detailText: widget.meeter.meetup_description,
                location: widget.meeter.meetup_location,
              ),
            ],
          ),
        ),
        _auth != null
            ? _auth.currentUser.uid != sellerDetails.uid
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DetailBar(widget.meeter, sellerDetails, likes),
                    ),
                  )
                : Container()
            : Container(),
      ]),
    );
  }
}
