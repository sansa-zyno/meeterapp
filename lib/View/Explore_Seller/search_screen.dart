import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_Seller/search_result_screen.dart';
import 'package:meeter/Widgets/HWidgets/search_filter.dart';
import 'package:meeter/Widgets/HWidgets/menu.dart';

class SearchScreen extends StatefulWidget {
  final searchText;
  SearchScreen(this.searchText);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController(text: widget.searchText);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(
        clr: Colors.blue,
      ),
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
                        height: 35,
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
                                height: 48,
                                width: 48,
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
                          /* Container(
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
                                /* suffixIcon: IconButton(
                                  onPressed: () async {
                                    QuerySnapshot qdoc = await FirebaseFirestore
                                        .instance
                                        .collection('meeters')
                                        .where("meetup_tags",
                                            arrayContains:
                                                searchController.text)
                                        .get();
                                    qdoc != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchResultScreen(
                                                      qdoc: qdoc),
                                            ),
                                          )
                                        : {};
                                  },
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: Colors.blue,
                                  ),
                                ),*/
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 1.6),
              SearchFilter(
                clr: Colors.blue,
                searchText: searchController.text,
              ),
              SizedBox(
                height: h * 8.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
