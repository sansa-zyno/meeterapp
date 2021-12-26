import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  Favourites({Key key}) : super(key: key);

  UserController _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserController>(context);
    return Scaffold(
      body:StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('meeters')
          .doc("${_currentUser.getCurrentUser.uid}")
          .collection('meeter')
          .snapshots(),
      builder: (ctx, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.all(8),
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Text(
                                  snapshot.data.docs[index]['meetup_title'])),
                          Text(
                              "${snapshot.data.docs[index]['meetup_likes'].toString()} likes")
                        ],
                      ),
                    ),
                  );
                })
            : Container();
      },
    ));
  }
}
