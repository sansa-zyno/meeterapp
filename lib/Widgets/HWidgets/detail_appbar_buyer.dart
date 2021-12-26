import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Services/database.dart';
import 'package:meeter/View/chat_screen.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/View/Explore_buyer/request_offer_buyer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailBarBuyer extends StatefulWidget {
  final DocumentSnapshot meeter2;
  final OurUser personDetails;
  final int likes;
  DetailBarBuyer(this.meeter2, this.personDetails, this.likes);

  @override
  _DetailBarBuyerState createState() => _DetailBarBuyerState();
}

class _DetailBarBuyerState extends State<DetailBarBuyer> {
  bool isLiked = false;

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return SafeArea(
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.green,
            width: w * 0.2,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isLiked
                ? IconButton(
                    onPressed: () async {
                      int previousLikes = widget.likes;
                      int prev = previousLikes - 1;
                      await FirebaseFirestore.instance
                          .collection('meeters2')
                          .doc(widget.personDetails.uid)
                          .collection('meeter2')
                          .doc(widget.meeter2.id)
                          .update({"demand_likes": prev});

                      isLiked = !isLiked;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      int previousLikes = widget.likes;
                      int prev = previousLikes + 1;
                      await FirebaseFirestore.instance
                          .collection('meeters2')
                          .doc(widget.personDetails.uid)
                          .collection('meeter2')
                          .doc(widget.meeter2.id)
                          .update({"demand_likes": prev});
                      isLiked = !isLiked;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
            Container(
              height: 40,
              child: GradientButton(
                textClr: Colors.black,
                title: "Chat",
                clrs: [Colors.white, Colors.white],
                //border: Border(bottom: BorderSide(color: Color(0XFF00FF00))),
                onpressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  String userName = preferences.getString('userName');
                  var chatroomId = getChatRoomIdByUsernames(
                      userName, widget.personDetails.displayName);
                  Map<String, dynamic> chatroomInfo = {
                    "users": [userName, widget.personDetails.displayName]
                  };
                  Database().createChatRoom(chatroomId, chatroomInfo);
                  widget.personDetails != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(widget.personDetails),
                          ),
                        )
                      : {};
                },
              ),
            ),
            Container(
              height: 40,
              child: GradientButton(
                clrs: [Colors.green, Colors.green],
                title: 'Make Offer',
                onpressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          RequestOfferBuyer(
                              doc: widget.meeter2,
                              personDetails: widget.personDetails),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
