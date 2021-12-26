import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_buyer/detail_buyer_screen.dart';
import 'package:meeter/View/Explore_buyer/more_buyer_screen.dart';

class MainListsBuyer extends StatelessWidget {
  final Color clr;
  final Color clr1;
  final List<QueryDocumentSnapshot> meeters2Collection;
  final String mainText;

  MainListsBuyer({this.meeters2Collection, this.mainText, this.clr, this.clr1});

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
      height: 156,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 4.3, vertical: h * 2.2),
                child: Text(
                  mainText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MoreBuyerScreen(meeters2Collection),
                        ),
                      );
                    },
                    child: Text(
                      '+ more',
                      style: TextStyle(
                        color: clr1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: h * 0.3),
          Container(
            height: 156,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: meeters2Collection.take(6).toList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: h * 2.4, vertical: w * 1.1),
                  child: GestureDetector(
                    child: Container(
                      height: 156,
                      width: 130,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border.all(color: clr),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 90,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                              child: Image.network(
                                meeters2Collection[index]['demand_bannerImage'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: h * 0.7, vertical: w * 0.3),
                              child: Text(
                                meeters2Collection[index]['demand_title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: h * 0.7, vertical: w * 0.3),
                              child: Text(
                                meeters2Collection[index]['demand_description'],
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>
                              DetailsBuyerScreen(meeters2Collection[index])));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15.0),
//                                 topRight: Radius.circular(15.0),
//                               ),
//                               // image: DecorationImage(

//                               //   image: AssetImage(

//                               //     picture,
//                               //   ),
//                               //   fit: BoxFit.fitWidth,

//                               // ),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15.0),
//                                 topRight: Radius.circular(15.0),
//                               ),
//                               child: Image.asset(picture),
//                             ),
//                             height: h * 11.2,
//                             width: w * 24.3,
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: h * 0.7, vertical: w * 0.3),
//                               child: Text(
//                                 text1,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.black,
//                                   fontSize: w * 4.1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: h * 0.7, vertical: w * 0.3),
//                               child: Text(
//                                 text2,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: w * 3.6,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
