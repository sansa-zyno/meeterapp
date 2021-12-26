import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Dashboard/activity.dart';
import 'package:meeter/View/Dashboard/activity_buyer.dart';
import 'package:meeter/View/Explore_Seller/meet_up_details.dart';

class UpcomingMeetings extends StatelessWidget {
  final List<QueryDocumentSnapshot> acceptedDemandsCollection;
  final Color clr;
  final Color clr1;

  UpcomingMeetings({this.clr, this.clr1, this.acceptedDemandsCollection});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: h * 13.4,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 4.8, vertical: h * 2.2),
                child: Text(
                  'UPCOMING MEETINGS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      clr == Colors.blue
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActivityScreen(
                                    acceptedDemandsCollection:
                                        acceptedDemandsCollection),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerActivityScreen(
                                    acceptedDemandsCollection:
                                        acceptedDemandsCollection),
                              ),
                            );
                    },
                    child: Text(
                      '+ more',
                      style: TextStyle(color: clr1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 4.8, vertical: h * 1.1),
                  child: Container(
                    decoration: BoxDecoration(
                        color: clr, borderRadius: BorderRadius.circular(15.0)),
                    height: 48,
                    width: 48,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        acceptedDemandsCollection.first['seller_image'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        acceptedDemandsCollection.first['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetUpDetails(
                                  acceptedDemandsCollection.first, clr),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
