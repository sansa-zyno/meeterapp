import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  Future addMessage(String chatRoomId, Map messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageInfoMap);
  }

  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        .snapshots();
  }

  //create chatting session between two people if they havent chatted before
  createChatRoom(String chatRoomId, Map chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .get();

    if (snapShot.exists) {
      // chatroom already exists
      return true;
    } else {
      // chatroom does not exists
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  //updates the last message sent in firebase
  updateLastMessageSend(String chatRoomId, Map lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  //get all the people the user has chatted with
  Future<Stream<QuerySnapshot>> getChatRooms() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String myUsername = _pref.getString('userName');
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .orderBy("lastMessageSendTs", descending: true)
        .where("users", arrayContains: myUsername)
        .snapshots();
  }

  Future acceptRequest(String sellerId, String docId, String buyerId) async {
    List<String> meeters = [sellerId, buyerId];
    await FirebaseFirestore.instance
        .collection("requests")
        .doc(sellerId)
        .collection('request')
        .doc(docId)
        .update({
      'meeters': meeters,
      "accepted": true,
      "acceptedBy": FirebaseAuth.instance.currentUser.uid,
      "modified": false
    });
  }

  Future cancelRequest(String sellerId, String docId) async {
    List<String> meeters = [];
    await FirebaseFirestore.instance
        .collection("requests")
        .doc(sellerId)
        .collection('request')
        .doc(docId)
        .update({
      'meeters': meeters,
      "accepted": false,
      "declinedBy": FirebaseAuth.instance.currentUser.uid,
      "modified": false
    });
  }
}
