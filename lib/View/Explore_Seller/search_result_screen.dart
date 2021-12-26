import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/HWidgets/searh_list.dart';
import 'package:meeter/Widgets/HWidgets/menu.dart';
import 'package:meeter/View/Dashboard/activity.dart';

class SearchResultScreen extends StatefulWidget {
  final List<DocumentSnapshot> ldoc;
  SearchResultScreen({this.ldoc});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<DocumentSnapshot> searchCollection = [];
  bool search = false;
  int i = 4;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 1.9, vertical: h * 0.8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 4.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: Container(
                                height: h * 5.6,
                                width: w * 12.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50 / 2),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ActivityScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: h * 5.6,
                                      width: w * 12.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50 / 2),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.notifications_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                        ],
                      ),
                      SizedBox(height: h * 10.1),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                hintText: 'Search',
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    searchCollection = [];
                                    QuerySnapshot docs = await FirebaseFirestore
                                        .instance
                                        .collection('meeters')
                                        .get();
                                    List<String> uids = [];
                                    for (int i = 0; i < docs.docs.length; i++) {
                                      uids.add(docs.docs[i].id);
                                    }

                                    for (int i = 0; i < uids.length; i++) {
                                      QuerySnapshot docs =
                                          await FirebaseFirestore.instance
                                              .collection('meeters')
                                              .doc(uids[i])
                                              .collection('meeter')
                                              .where('meetup_tags',
                                                  arrayContains:
                                                      searchController.text)
                                              .get();
                                      for (int i = 0;
                                          i < docs.docs.length;
                                          i++) {
                                        searchCollection.add(docs.docs[i]);
                                        search = true;
                                        setState(() {});
                                      }
                                    }

                                    //setState() {}
                                    ;
                                  },
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 1.1),
              SearchList(
                clr: Colors.blue,
                ldoc: search
                    ? searchCollection.take(i).toList()
                    : widget.ldoc.take(i).toList(),
              ),
              SizedBox(height: h * 1.1),
              Container(
                width: w * 65.8,
                height: h * 5.6,
                child: GradientButton(
                  title: "View More",
                  fontSize: w * 2.9,
                  clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                  onpressed: () {
                    i += 4;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: h * 3.3),
            ],
          ),
        ),
      ),
    );
  }
}
