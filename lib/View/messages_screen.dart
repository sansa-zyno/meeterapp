import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Services/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_screen.dart';

class Messages extends StatefulWidget {
  Messages({Key key}) : super(key: key);
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String myName;
  getMyName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    myName = _pref.getString('userName');
    setState(() {});
  }

  Stream chatroomStream;
  getChatRooms() async {
    chatroomStream = await Database().getChatRooms();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getChatRooms();
    getMyName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          //leading: Icon(Icons.notifications, color: Colors.black87,),
          title: Text(
            'Inbox',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
            stream: chatroomStream,
            builder: (ctx, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (cxt, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        return ChatRoomListTile(
                            ds["lastMessage"], ds['type'], ds.id, myName);
                      })
                  : Container();
            }),
      ),
    );
  }
}

class ChatRoomListTile extends StatefulWidget {
  final String lastMessage, type, chatRoomId, myUsername;
  ChatRoomListTile(
      this.lastMessage, this.type, this.chatRoomId, this.myUsername);
  @override
  _ChatRoomListTileState createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String profilePicUrl = "", name = "", username = "";
  OurUser user;

  getUserInfo() async {
    username =
        widget.chatRoomId.replaceAll(widget.myUsername, "").replaceAll("_", "");
    QuerySnapshot _doc = await FirebaseFirestore.instance
        .collection('users')
        .where('displayName', isEqualTo: username)
        .get();
    user = OurUser.fromFireStore(_doc.docs[0]);
    profilePicUrl = user.avatarUrl;
    name = username;
    setState(() {});
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen(user)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profilePicUrl,
                  fit: BoxFit.fill,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                widget.type == "text"
                    ? Text(widget.lastMessage)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.lastMessage,
                          height: 60,
                          width: 60,
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
