/*import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';

class PhysicalOffer extends StatefulWidget {
  @override
  _PhysicalOfferState createState() => _PhysicalOfferState();
}

class _PhysicalOfferState extends State<PhysicalOffer> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: h * 14.2,
                ),
                Center(
                  child: Padding(
                     padding:  EdgeInsets.symmetric(vertical:h*3.3,horizontal: w*7.3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: w * 2.4,
                            ),
                            Text(
                              'Hosted by Joe',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: w * 4.8,
                        ),
                        Text(
                          'New to yoga or looking to take your mat to ptactice in new places?\nGet to know your local community and neighbours better by joining our family.',
                          style: TextStyle(
                            fontSize: w * 4.3,
                            color: Colors.grey,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Read more',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: w * 2.4,
                            ),
                            Text(
                              '\$ 28',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 3.3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: w * 2.4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NOV 12',
                                  style: TextStyle(
                                    fontSize: w * 4.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: h*0.7,
                                ),
                                Text(
                                  '6:00 PM - 8:00 PM',
                                  style: TextStyle(
                                    fontSize: w*4.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 3.3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: w * 2.4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Boy Department Store (7th Floor \nrestaurant/cafeteria dining hall)',
                                  style: TextStyle(
                                    fontSize: w*4.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: h * 2.2),
                                Text(
                                  'ABC - XYZ NewYork City',
                                  style: TextStyle(
                                    fontSize: w*4.1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: h * 2.2),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff00AEFF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          height: h * 14.6,
                          width: w * 75.6,
                        ),
                        SizedBox(height: h * 2.2),
                        Text(
                          'Asking for 10% discount if it is online meeting.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: w*4.3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: h * 3.3),
                        Container(
                          width: w * 36.7,
                          height: h * 5.6,
                          child: GradientButton(
                            title: "Confirm",
                            fontSize: w*3.6,
                            clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                            onpressed: () {},
                          ),
                        ),
                        SizedBox(height: h * 2.2),
                        Container(
                          width: w * 36.7,
                          height: h * 5.6,
                          child: GradientButton(
                            title: "Decline",
                            fontSize:  w*3.6,
                            textClr: Color(0xff00AEFF),
                            clrs: [Colors.white, Colors.white],
                            border: Border.all(color: Colors.blueAccent),
                            onpressed: () {},
                          ),
                        ),
                        SizedBox(height: h * 2.2),
                        Container(
                          width: w * 36.7,
                          height: h * 5.6,
                          child: GradientButton(
                            title: "Chat",
                            fontSize:  w*3.6,
                            textClr: Color(0xff00AEFF),
                            clrs: [Colors.white, Colors.white],
                            border: Border.all(color: Colors.blueAccent),
                            onpressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MeeterAppbar(
            title: "Meet up Request",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}*/
