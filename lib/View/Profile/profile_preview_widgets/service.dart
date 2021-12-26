import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/View/Profile/edit_meet_setup.dart';
import 'package:provider/provider.dart';

class Services extends StatelessWidget {
  Services({Key key}) : super(key: key);

  UserController _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserController>(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('meeters')
          .doc(_currentUser.getCurrentUser.uid)
          .collection('meeter')
          .snapshots(),
      builder: (ctx, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                padding: EdgeInsets.symmetric(vertical: 8),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.docs[index]['meetup_title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data.docs[index]
                                      ['meetup_description'],
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(snapshot.data.docs[index]
                                    ['meetup_location']),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(snapshot.data.docs[index]['meetup_price']
                                    .toString()),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              MaterialButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => EditMeetSetup(
                                                snapshot.data.docs[index])));
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              MaterialButton(
                                  color: Colors.red,
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('meeters')
                                        .doc(_currentUser.getCurrentUser.uid)
                                        .collection('meeter')
                                        .doc(snapshot.data.docs[index].id)
                                        .delete();
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ]),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Container();
      },
    );
  }
}
