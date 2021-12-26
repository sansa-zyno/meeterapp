import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';

class MeetingInProgress extends StatefulWidget {
  @override
  _MeetingInProgressState createState() => _MeetingInProgressState();
}

class _MeetingInProgressState extends State<MeetingInProgress> {
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
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: h * 3.3, horizontal: w * 7.3),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 13.4,
                    ),
                    InkWell(
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: h * 1.6,
                              right: w * 2.4,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Meeting time\n\nLeft: \n26:03\n',
                                    style: TextStyle(
                                      fontSize: w * 4.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Current time: 6:28pm\n\nTap to pause / and \nmeeting',
                                    style: TextStyle(
                                      fontSize: w * 2.9,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        height: h * 42,
                        width: w * 85.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          image: DecorationImage(
                              image: AssetImage('assets/images/data/clock.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: h * 1.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: w * 2.4,
                        ),
                        Text(
                          'You are meeting: Ehsan',
                          style: TextStyle(
                            fontSize: w * 4.8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                          width: w * 0.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: h * 6.7,
                      width: w * 80.4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Text(
                              'Requested Time:',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '40 min /\$10',
                                style: TextStyle(
                                  fontSize: w * 4.8,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                          width: w * 0.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: h * 6.7,
                      width: w * 80.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 7.3),
                        child: Row(
                          children: [
                            Text(
                              'Minimum Time:',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '30 min',
                                style: TextStyle(
                                  fontSize: w * 4.8,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                          width: w * 0.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: h * 6.7,
                      width: w * 80.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 7.3),
                        child: Row(
                          children: [
                            Text(
                              'Maximum Time:',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '45 min',
                                style: TextStyle(
                                  fontSize: w * 4.8,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                          width: w * 0.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: h * 6.7,
                      width: w * 80.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 7.3),
                        child: Row(
                          children: [
                            Text(
                              'Extra Charge:',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1 / 5 min',
                                style: TextStyle(
                                  fontSize: w * 4.8,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                          width: w * 0.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: h * 6.7,
                      width: w * 80.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 7.3),
                        child: Row(
                          children: [
                            Text(
                              'Current Charge:',
                              style: TextStyle(
                                fontSize: w * 4.8,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$5',
                                style: TextStyle(
                                  fontSize: w * 4.8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Text(
                      'Having a issue?',
                      style: TextStyle(
                          fontSize: w * 4.8,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: h * 2.2,
                    ),
                    Row(
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: w * 39.0, height: h * 5.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Common Problems',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: w * 3.5,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: w * 39.0, height: h * 5.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Emergency',
                                  style: TextStyle(
                                    fontSize: w * 4.3,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
}
