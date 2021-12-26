import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:provider/provider.dart';

class Demands extends StatefulWidget {
  Demands({Key key}) : super(key: key);

  @override
  _DemandsState createState() => _DemandsState();
}

class _DemandsState extends State<Demands> {
  UserController _currentUser;

  bool show = true;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserController>(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('demands')
          .doc(_currentUser.getCurrentUser.uid)
          .collection('demand')
          .snapshots(),
      builder: (ctx, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.docs[index]['title'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(snapshot.data.docs[index]['buyer_name']),
                              SizedBox(
                                width: 3,
                              ),
                              Text(snapshot.data.docs[index]['date']),
                              SizedBox(
                                width: 3,
                              ),
                              Text(snapshot.data.docs[index]['time']),
                              // SizedBox(
                              //  width: 3,
                              // ),
                              //Text(snapshot.data.docs[index]['scheduled_location']),
                            ],
                          ),
                          show
                              ? Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('accepted_demands')
                                            .doc(snapshot.data.docs[index]
                                                ['buyer_id'])
                                            .set({"ad": "ad"});
                                        await FirebaseFirestore.instance
                                            .collection('accepted_demands')
                                            .doc(snapshot.data.docs[index]
                                                ['buyer_id'])
                                            .collection('accepted_demand')
                                            .add({
                                          "title": snapshot.data.docs[index]
                                              ['title'],
                                          "desc": snapshot.data.docs[index]
                                              ['desc'],
                                          "price": snapshot.data.docs[index]
                                              ['price'],
                                          "date": snapshot.data.docs[index]
                                              ['date'],
                                          "time": snapshot.data.docs[index]
                                              ['time'],
                                          'doc_id':
                                              snapshot.data.docs[index].id,
                                          "seller_image": snapshot
                                              .data.docs[index]['seller_image'],
                                          "location": snapshot.data.docs[index]
                                              ['location'],
                                          "seller_name": _currentUser
                                              .getCurrentUser.displayName,
                                          "seller_id":
                                              _currentUser.getCurrentUser.uid,
                                          "question": snapshot.data.docs[index]
                                              ['question'],
                                          "seller_location": snapshot.data
                                              .docs[index]['seller_location'],
                                        });
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      child: Text('Accept'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('demands')
                                            .doc(
                                                _currentUser.getCurrentUser.uid)
                                            .collection('demand')
                                            .doc(snapshot.data.docs[index].id)
                                            .delete();
                                      },
                                      color: Colors.red,
                                      child: Text(
                                        'Reject',
                                      ),
                                    )
                                  ],
                                )
                              : Container()
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
