import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeter/View/Explore_Seller/meet_up_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/View/chat_screen.dart';

class RecentData extends StatelessWidget {
  final Color clr;
  final DocumentSnapshot request;
  final DocumentSnapshot msg;
  final String text;
  final String username;
  RecentData({this.clr, this.request, this.msg, this.text, this.username});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return text == "new"
        ? request['seller_id'] == FirebaseAuth.instance.currentUser.uid
            ? Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => MeetUpDetails(request, clr)));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    /*decoration: BoxDecoration(
                  border: Border.all(
                    color: clr,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),*/
                    height: height / 8,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 40, vertical: height / 100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10),
                              ),
                            ),
                            height: height / 13,
                            width: width / 9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                request['buyer_image'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 100.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Meet up request',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: width / 21,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width / 60),
                                            child: Container(
                                              width: 500,
                                              child: Text(
                                                '????${request['time']}',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      'You received a meet up request from ${request["buyer_name"]}',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: width / 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container()
        : text == "msg"
            ? msg["lastMessageSendBy"] != username
                ? Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 60),
                    child: GestureDetector(
                      onTap: () async {
                        QuerySnapshot _doc = await FirebaseFirestore.instance
                            .collection('users')
                            .where('displayName',
                                isEqualTo: msg["lastMessageSendBy"])
                            .get();
                        OurUser user = OurUser.fromFireStore(_doc.docs[0]);

                        QuerySnapshot q = await FirebaseFirestore.instance
                            .collection("chatrooms")
                            .doc(msg.id)
                            .collection('chats')
                            .where("read", isEqualTo: false)
                            .get();
                        for (int i = 0; i < q.docs.length; i++) {
                          await FirebaseFirestore.instance
                              .collection("chatrooms")
                              .doc(msg.id)
                              .collection('chats')
                              .doc(q.docs[i].id)
                              .update({"read": true});
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => ChatScreen(user)));

                        await FirebaseFirestore.instance
                            .collection("chatrooms")
                            .doc(msg.id)
                            .update({"read": true});
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        /*decoration: BoxDecoration(
                  border: Border.all(
                    color: clr,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),*/
                        height: height / 8,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 40,
                                  vertical: height / 100),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                  ),
                                ),
                                height: height / 13,
                                width: width / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    msg['lastMessageSendByImgUrl'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height / 100.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'New message',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width / 21,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          'You received a new message from ${msg["lastMessageSendBy"]}',
                                          //overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: width / 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container()
            : text == "modified"
                ? request['modifiedBy'] !=
                            FirebaseAuth.instance.currentUser.uid &&
                        request['buyer_id'] ==
                            FirebaseAuth.instance.currentUser.uid
                    ? Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 60),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        MeetUpDetails(request, clr)));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            /* decoration: BoxDecoration(
                      border: Border.all(
                        color: clr,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),*/
                            height: height / 6.8,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 40,
                                      vertical: height / 100),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    height: height / 13,
                                    width: width / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        request['seller_image'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height / 100.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Meet up request modified',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: width / 21,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width / 60),
                                                    child: Text(
                                                      '????${request['time']}',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              'You received a meet up modification from ${request["seller_name"]}',
                                              //overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: width / 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : request['modifiedBy'] !=
                                FirebaseAuth.instance.currentUser.uid &&
                            request['seller_id'] ==
                                FirebaseAuth.instance.currentUser.uid
                        ? Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 60),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            MeetUpDetails(request, clr)));
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                /* decoration: BoxDecoration(
                      border: Border.all(
                        color: clr,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),*/
                                height: height / 6.8,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width / 40,
                                          vertical: height / 100),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(10),
                                          ),
                                        ),
                                        height: height / 13,
                                        width: width / 9,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            request['buyer_image'],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height / 100.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Meet up request modified',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: width / 21,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width / 60),
                                                        child: Text(
                                                          '????${request['time']}',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  'You received a meet up modification from ${request["buyer_name"]}',
                                                  //overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: width / 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container()
                : text == "accepted"
                    ? request['acceptedBy'] !=
                                FirebaseAuth.instance.currentUser.uid &&
                            request['buyer_id'] ==
                                FirebaseAuth.instance.currentUser.uid
                        ? Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 60),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            MeetUpDetails(request, clr)));
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                /*decoration: BoxDecoration(
                          border: Border.all(
                            color: clr,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),*/
                                height: height / 6.8,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width / 50,
                                          vertical: height / 100),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(10),
                                          ),
                                        ),
                                        height: height / 13,
                                        width: width / 9,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            request['seller_image'],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height / 120.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Meet up request accepted',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: width / 21,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width / 60),
                                                        child: Text(
                                                          '????${request['time']}',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  'Your meet up request was accepted by ${request["seller_name"]}',
                                                  //overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: width / 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : request['acceptedBy'] !=
                                    FirebaseAuth.instance.currentUser.uid &&
                                request['seller_id'] ==
                                    FirebaseAuth.instance.currentUser.uid
                            ? Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 60),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                MeetUpDetails(request, clr)));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    /*decoration: BoxDecoration(
                          border: Border.all(
                            color: clr,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),*/
                                    height: height / 6.8,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 50,
                                              vertical: height / 100),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(10),
                                              ),
                                            ),
                                            height: height / 13,
                                            width: width / 9,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                request['buyer_image'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: height / 120.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Meet up request accepted',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize:
                                                                  width / 21,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width /
                                                                            60),
                                                            child: Text(
                                                              '????${request['time']}',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'Meet up request was re-accepted by ${request["buyer_name"]}',
                                                      //overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: width / 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                    : text == "cancelled"
                        ? request['declinedBy'] !=
                                    FirebaseAuth.instance.currentUser.uid &&
                                request['buyer_id'] ==
                                    FirebaseAuth.instance.currentUser.uid
                            ? Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 60),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                MeetUpDetails(request, clr)));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    /*decoration: BoxDecoration(
                              border: Border.all(
                                color: clr,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),*/
                                    height: height / 6.8,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 40,
                                              vertical: height / 100),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(10),
                                              ),
                                            ),
                                            height: height / 13,
                                            width: width / 9,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                request['seller_image'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: height / 100.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Meet up request cancelled',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize:
                                                                  width / 21,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width /
                                                                            60),
                                                            child: Text(
                                                              '????${request['time']}',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'Your meet up request was declined by ${request["seller_name"]}',
                                                      //overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: width / 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : request['declinedBy'] !=
                                        FirebaseAuth.instance.currentUser.uid &&
                                    request['seller_id'] ==
                                        FirebaseAuth.instance.currentUser.uid
                                ? Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 60),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => MeetUpDetails(
                                                    request, clr)));
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        /*decoration: BoxDecoration(
                              border: Border.all(
                                color: clr,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),*/
                                        height: height / 6.8,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 40,
                                                  vertical: height / 100),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    bottom: Radius.circular(10),
                                                  ),
                                                ),
                                                height: height / 13,
                                                width: width / 9,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.network(
                                                    request['buyer_image'],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: height / 100.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Meet up request cancelled',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      width /
                                                                          21,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            width /
                                                                                60),
                                                                child: Text(
                                                                  '????${request['time']}',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          'Meet up declined by ${request["buyer_name"]}',
                                                          //overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize:
                                                                width / 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                        : Container();
  }
}
