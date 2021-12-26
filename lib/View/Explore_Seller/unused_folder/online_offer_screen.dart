/*import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';

class OnlineOffer extends StatefulWidget {
  @override
  _OnlineOfferState createState() => _OnlineOfferState();
}

class _OnlineOfferState extends State<OnlineOffer> {
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
                          height:  w * 4.8,
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
                            ),
                            SizedBox(
                              width: w*2.4,
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
                                Text(
                                  '6:00 PM - 8:00 PM',
                                  style: TextStyle(
                                    fontSize:  w*4.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 5.6,
                        ),
                        Container(
                          width: w * 36.7,
                          height: h * 5.6,
                          child: GradientButton(
                            title: "Confirm",
                            fontSize:  w*3.6,
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
                            title: "Chat",
                            fontSize:  w*3.6,
                            clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
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
