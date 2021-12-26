import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeter/View/Explore_Seller/meet_up_details.dart';

class RecentData extends StatelessWidget {
  final Color clr;
  final List<QueryDocumentSnapshot> acceptedDemandsCollection;
  RecentData({this.clr, this.acceptedDemandsCollection});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: acceptedDemandsCollection.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 35),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => MeetUpDetails(
                            acceptedDemandsCollection[index], clr)));
              },
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: clr,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: height / 13,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 35, vertical: height / 100),
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
                            acceptedDemandsCollection[index]['seller_image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 100.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meet up request',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width / 21,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width / 28.0),
                                      child: Text(
                                        '🕒${acceptedDemandsCollection[index]['time']}',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  'You received a meet up request from.....',
                                  overflow: TextOverflow.ellipsis,
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
          );
        });
  }
}
