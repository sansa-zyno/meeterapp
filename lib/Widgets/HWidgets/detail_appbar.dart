import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Services/database.dart';
import 'package:meeter/View/chat_screen.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/View/Explore_Seller/request_offer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailBar extends StatefulWidget {
  final DocumentSnapshot meeter;
  final OurUser sellerDetails;
  final int likes;
  DetailBar(this.meeter, this.sellerDetails, this.likes);

  @override
  _DetailBarState createState() => _DetailBarState();
}

class _DetailBarState extends State<DetailBar> {
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
            color: Color(0xff00AEFF),
            width: w * 0.2,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isLiked
                ? IconButton(
                    onPressed: () async {
                      int previousLikes = widget.likes;
                      int prev = previousLikes - 1;
                      await FirebaseFirestore.instance
                          .collection('meeters')
                          .doc(widget.sellerDetails.uid)
                          .collection('meeter')
                          .doc(widget.meeter.id)
                          .update({"meetup_likes": prev});

                      isLiked = !isLiked;
                      setState(() {});
                    },
                    icon: Container(
                      height: 40,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      int previousLikes = widget.likes;
                      int prev = previousLikes + 1;
                      await FirebaseFirestore.instance
                          .collection('meeters')
                          .doc(widget.sellerDetails.uid)
                          .collection('meeter')
                          .doc(widget.meeter.id)
                          .update({"meetup_likes": prev});
                      isLiked = !isLiked;
                      setState(() {});
                    },
                    icon: Container(
                      height: 40,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ),
            Container(
              height: 40,
              child: GradientButton(
                  textClr: Colors.black,
                  title: "Chat",
                  clrs: [Colors.white, Colors.white],
                  border: Border(bottom: BorderSide(color: Colors.blue)),
                  onpressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    String userName = preferences.getString('userName');
                    if (widget.sellerDetails != null) {
                      print(userName);
                      var chatroomId = getChatRoomIdByUsernames(
                          userName, widget.sellerDetails.displayName);
                      Map<String, dynamic> chatroomInfo = {
                        "users": [userName, widget.sellerDetails.displayName]
                      };
                      Database().createChatRoom(chatroomId, chatroomInfo);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(widget.sellerDetails),
                        ),
                      );
                    } else {}
                    ;
                  }),
            ),
            Container(
              height: 40,
              child: GradientButton(
                clrs: [Colors.blue, Colors.blue],
                title: 'Make Offer',
                onpressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          RequestOffer(
                              doc: widget.meeter,
                              sellerDetails: widget.sellerDetails),
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
