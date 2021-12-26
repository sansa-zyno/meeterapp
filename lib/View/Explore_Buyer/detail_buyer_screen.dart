import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Widgets/HWidgets/detail_data.dart';
import 'package:meeter/Widgets/HWidgets/detail_appbar_buyer.dart';

class DetailsBuyerScreen extends StatefulWidget {
  final DocumentSnapshot meeter2;
  DetailsBuyerScreen(this.meeter2);
  @override
  _DetailsBuyerScreenState createState() => _DetailsBuyerScreenState();
}

class _DetailsBuyerScreenState extends State<DetailsBuyerScreen> {
  OurUser personDetails;
  int likes;

  onLoad() async {
    UserController user = UserController();
    print(widget.meeter2.id);
    personDetails = await user.getUserInfo(widget.meeter2['demand_person_uid']);
    print(personDetails.uid);
    FirebaseFirestore.instance
        .collection('meeters2')
        .doc(personDetails.uid)
        .collection('meeter2')
        .doc(widget.meeter2.id)
        .snapshots()
        .listen((event) {
      likes = event['demand_likes'];
      setState(() {});
    });
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
                  bannerImage: widget.meeter2['demand_bannerImage'],
                  titleText: widget.meeter2['demand_title'],
                  priceText: "\$${widget.meeter2['demand_price']}",
                  priceText1: '/ 30 min',
                  timeText: widget.meeter2['demand_available_online']
                      ? "Availabe"
                      : "Not available",
                  likesText: likes ?? 0,
                  // categoryText: 'In Category',
                  detailText: widget.meeter2['demand_description'],
                  location: widget.meeter2['demand_location'],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DetailBarBuyer(widget.meeter2, personDetails, likes),
            ),
          )
        ],
      ),
    );
  }
}
