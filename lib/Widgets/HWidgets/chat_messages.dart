import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMessages extends StatefulWidget {
  final OurUser recipient;

  ChatMessages(this.recipient);

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  Stream messageStream;
  String myUserName, chatRoomId = "";

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  getMyInfoFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myUserName = prefs.getString('userName');
    print(myUserName);
    print("------------");
    print(widget.recipient.displayName);
    chatRoomId =
        getChatRoomIdByUsernames(widget.recipient.displayName, myUserName);
  }

  getAndSetMessages() async {
    messageStream = await Database().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  Widget chatMessageTile(String message, bool sendByMe, h, w) {
    return !sendByMe
        ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  height: h * 5.6,
                  width: w * 12.1,
                  child: Image.network(
                    widget.recipient.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget imageMessageTile(String url, bool sendByMe) {
    return sendByMe
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Icon(Icons.phone,color: const Color(0xff7672c9),),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(
                  right: 15,
                  top: 10,
                  bottom: 10,
                ),
                child: FittedBox(fit: BoxFit.fill, child: Image.network(url)),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon(Icons.phone,color: const Color(0xff7672c9),),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(
                  left: 15,
                  top: 10,
                  bottom: 10,
                ),
                child: FittedBox(fit: BoxFit.fill, child: Image.network(url)),
              ),
            ],
          );
  }

  Widget chatMessages(
    h,
    w,
  ) {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 70, top: 16),
                itemCount: snapshot.data.docs.length,
                physics: ClampingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return ds['type'] == 'text'
                      ? chatMessageTile(
                          ds["message"],
                          myUserName == ds["sendBy"],
                          h,
                          w,
                        )
                      : imageMessageTile(
                          ds['photoUrl'], myUserName == ds["sendBy"]);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
    await getAndSetMessages();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doThisOnLaunch();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return SafeArea(
      child: chatMessages(
        h,
        w,
      ),
    );
  }
}
