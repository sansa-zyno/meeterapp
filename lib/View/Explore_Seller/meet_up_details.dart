import 'package:flutter/material.dart';
import 'package:meeter/Services/database.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeter/View/Explore_Seller/edit_request_offer_screen.dart';
import 'package:meeter/View/Explore_Seller/timer_screen.dart';
import 'package:meeter/View/chat_screen.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar_buyer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeetUpDetails extends StatefulWidget {
  final QueryDocumentSnapshot acceptedDemand;
  final Color clr;
  const MeetUpDetails(this.acceptedDemand, this.clr);

  @override
  _MeetUpDetailsState createState() => _MeetUpDetailsState();
}

class _MeetUpDetailsState extends State<MeetUpDetails> {
  OurUser sellerDetails;
  UserController userController = UserController();

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  getSellerDetails() async {
    sellerDetails =
        await userController.getUserInfo(widget.acceptedDemand['seller_id']);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSellerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text("Hosted By ${widget.acceptedDemand['seller_name']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.acceptedDemand['desc'],
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Read more',
                    style: TextStyle(
                      color: widget.clr,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Row(children: [
                    Icon(Icons.calendar_view_day),
                    SizedBox(width: 8),
                    Text(
                      widget.acceptedDemand['price'],
                    ),
                  ]),
                  SizedBox(height: 30),
                  Row(children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.acceptedDemand['date']),
                        SizedBox(height: 3),
                        Text(widget.acceptedDemand['time']),
                      ],
                    ),
                  ]),
                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: widget.clr),
                              borderRadius: BorderRadius.circular(15),
                              color: widget.clr,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Cancel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => EditRequestOffer(
                                    doc: widget.acceptedDemand,
                                    clr: widget.clr)));
                          },
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: widget.clr),
                              borderRadius: BorderRadius.circular(15),
                              color: widget.clr,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Modify',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            String userName = preferences.getString('userName');
                            if (sellerDetails != null) {
                              var chatroomId = getChatRoomIdByUsernames(
                                  userName, sellerDetails.displayName);
                              Map<String, dynamic> chatroomInfo = {
                                "users": [userName, sellerDetails.displayName]
                              };
                              Database()
                                  .createChatRoom(chatroomId, chatroomInfo);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChatScreen(sellerDetails),
                                ),
                              );
                            } else {}
                            ;
                          },
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: widget.clr),
                              borderRadius: BorderRadius.circular(15),
                              color: widget.clr,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Chat',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    Timer(widget.acceptedDemand)));
                          },
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: widget.clr),
                              borderRadius: BorderRadius.circular(15),
                              color: widget.clr,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Start Meeting',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                      "Warning: Modification will not be available from 24 hours before the meeting"),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
          widget.clr == Colors.blue
              ? MeeterAppbar(
                  title: "Meet Up Details",
                  icon: Icons.arrow_back_rounded,
                )
              : MeeterAppbarBuyer(
                  title: "Meet Up Details",
                  icon: Icons.arrow_back_rounded,
                ),
        ],
      ),
    );
  }
}
