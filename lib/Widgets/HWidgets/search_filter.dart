import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:meeter/View/Explore_Seller/search_result_screen.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';

class SearchFilter extends StatefulWidget {
  final Color clr;
  final searchText;
  SearchFilter({this.clr, this.searchText});
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  RangeValues _currentRangeValues = RangeValues(0, 100);
  double minimum;
  double maximum;

  int tag = 1;
  int tag1 = 2;

  List<String> joboptions = [
    'Marketing',
    'Buisness',
    'Industry',
    'Training',
    'Trade',
  ];

  List<String> locationoptions = [
    'Online',
    'On-site',
  ];

  @override
  Widget build(BuildContext context) {
    minimum = _currentRangeValues.start;
    maximum = _currentRangeValues.end;

    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);

    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                  border: Border.all(
                    width: w * 0.2,
                    color: widget.clr,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: w * 36.5,
                      height: h * 6.7,
                      child: Divider(
                        thickness: 5,
                        color: Colors.grey[30],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 4.8, vertical: h * 1.6),
                            child: Text(
                              'Price Range (\$${minimum.ceil()} - \$${maximum.ceil()})',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 5.3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                child: Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            activeTrackColor: widget.clr,
                                            thumbColor: widget.clr,
                                            showValueIndicator:
                                                ShowValueIndicator.always,
                                          ),
                                          child: RangeSlider(
                                            values: _currentRangeValues,
                                            min: 0,
                                            max: 100,
                                            divisions: null,
                                            labels: RangeLabels(
                                              _currentRangeValues.start
                                                  .round()
                                                  .toString(),
                                              _currentRangeValues.end
                                                  .round()
                                                  .toString(),
                                            ),
                                            onChanged: (RangeValues values) {
                                              setState(
                                                () {
                                                  _currentRangeValues = values;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 4.8, vertical: h * 1.6),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 5.3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          ChipsChoice<int>.single(
                            choiceStyle: C2ChoiceStyle(
                              color: widget.clr,
                            ),
                            value: tag,
                            onChanged: (val) => setState(() => tag = val),
                            choiceItems: C2Choice.listFrom<int, String>(
                              source: joboptions,
                              value: (i, v) => i,
                              label: (i, v) => v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 4.8, vertical: h * 1.6),
                            child: Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 5.3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          ChipsChoice<int>.single(
                            choiceStyle: C2ChoiceStyle(
                              color: widget.clr,
                            ),
                            value: tag1,
                            onChanged: (val) => setState(() => tag1 = val),
                            choiceItems: C2Choice.listFrom<int, String>(
                              source: locationoptions,
                              value: (i, v) => i,
                              label: (i, v) => v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 3.3,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 1.2),
                              height: 48,
                              child: GradientButton(
                                title: "Show Result",
                                clrs: [widget.clr, widget.clr],
                                fontSize: w * 2.9,
                                letterSpacing: 0,
                                onpressed: () async {
                                  if (widget.clr == Colors.blue) {
                                    List<DocumentSnapshot> searchCollection =
                                        [];
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
                                                      widget.searchText)
                                              .where("meetup_price",
                                                  isGreaterThanOrEqualTo:
                                                      _currentRangeValues.start)
                                              .where("meetup_price",
                                                  isLessThanOrEqualTo:
                                                      _currentRangeValues.end)
                                              .where('meetup_available_online',
                                                  isEqualTo:
                                                      tag1 == 1 ? true : false)
                                              .get();
                                      for (int i = 0;
                                          i < docs.docs.length;
                                          i++) {
                                        searchCollection.add(docs.docs[i]);
                                        setState(() {});
                                      }
                                    }

                                    searchCollection.isNotEmpty
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchResultScreen(
                                                      ldoc: searchCollection),
                                            ),
                                          )
                                        : {};
                                  } else {}
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 1.2),
                              height: 48,
                              child: GradientButton(
                                fontSize: 12,
                                letterSpacing: 0,
                                title: "Clear",
                                textClr: widget.clr,
                                clrs: [Colors.white, Colors.white],
                                border: Border.all(
                                  color: widget.clr,
                                ),
                                onpressed: () {
                                  setState(() {
                                    _currentRangeValues = RangeValues(0, 100);
                                    tag = null;
                                    tag1 = null;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 3.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
