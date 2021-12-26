import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Providers/location_provider.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/HWidgets/offer_appbar.dart';
import 'package:meeter/Widgets/HWidgets/offer_appbar_buyer.dart';
import 'package:provider/provider.dart';

class EditRequestOffer extends StatefulWidget {
  final DocumentSnapshot doc;
  final Color clr;
  EditRequestOffer({this.doc, this.clr});
  @override
  _EditRequestOfferState createState() => _EditRequestOfferState();
}

class _EditRequestOfferState extends State<EditRequestOffer> {
  UserController _currentUser;
  LocationProvider userLoc;
  //Completer<GoogleMapController> _mapController = Completer();
  DatePickerController datePickerController = DatePickerController();
  TextEditingController questionController;
  String time;
  DateTime date;
  int _value = 1;
  bool isButtonPressed1 = false;
  bool isButtonPressed2 = false;
  List<String> _time = [
    '10:00 - 11:00 AM',
    '11:00 - 12:00 PM',
    '12:00 - 1:00 PM',
    '1:00 - 2:00 PM',
    '2:00 - 3:00 PM',
    '3:00 - 4:00 PM'
  ];
  /*TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionController = TextEditingController(text: widget.doc['question']);
    time = widget.doc['time'];
    widget.doc['location'] == "Physical" ? _value = 1 : _value = 2;
    date = DateTime.parse(widget.doc['date']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    _currentUser = Provider.of<UserController>(context);
    userLoc = Provider.of<LocationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: h * 32.5),
                Center(
                  child: SizedBox(
                    width: w * 85.3,
                    child: TextField(
                      controller: questionController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: widget.clr,
                            width: w * 0.4,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: widget.clr,
                            width: w * 0.2,
                          ),
                        ),
                        hintText:
                            'Topic Asked: \nHow did you find a co-founder? \nHow did you find investor for start-up? \nDo i need to know coding and finance to do a start-up? \nWhat is the new advice do you give to new start-up?',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintMaxLines: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 2.2),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 2.4, vertical: h * 1.1),
                    child: DatePicker(
                      DateTime.now(),
                      controller: datePickerController,
                      initialSelectedDate: date,
                      selectionColor: widget.clr,
                      selectedTextColor: Colors.white,
                      onDateChange: (dte) {
                        setState(() {
                          date = dte;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: h * 1.1),
                Container(
                  width: w * 88.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: widget.clr,
                      width: w * 0.2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 3.6,
                          vertical: h * 2.2,
                        ),
                        child: Text(
                          'Choose Available Time',
                          style: TextStyle(
                              color: widget.clr,
                              fontSize: w * 6.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 3.6,
                        ),
                        child: Text(
                          'Slide to view available time',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: w * 4.3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 16,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _time.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * 3.6,
                                vertical: h * 2.2,
                              ),
                              child: Column(
                                children: [
                                  index % 2 == 0
                                      ? Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: h * 2.2),
                                            child: RaisedButton(
                                              color: isButtonPressed1
                                                  ? widget.clr
                                                  : Colors.grey[200],
                                              child: Text(
                                                _time[index],
                                                style: TextStyle(
                                                  fontSize: w * 4.3,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  time = _time[index];
                                                  isButtonPressed1 =
                                                      !isButtonPressed1;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: h * 2.2),
                                            child: RaisedButton(
                                              color: isButtonPressed2
                                                  ? widget.clr
                                                  : Colors.grey[200],
                                              child: Text(
                                                _time[index],
                                                style: TextStyle(
                                                  fontSize: w * 4.3,
                                                ),
                                              ),
                                              onPressed: () {
                                                time = _time[index];
                                                setState(() {
                                                  isButtonPressed2 =
                                                      !isButtonPressed2;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 2.2),
                Container(
                  width: w * 80.4,
                  height: h * 6.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: widget.clr,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 4.8, vertical: h * 2.2),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Physical"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Virtual"),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(
                          () {
                            _value = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: h * 2.2),
                _value == 1
                    ? Container(
                        width: w * 80.4,
                        // height: h * 6.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: widget.clr,
                            width: w * 0.04,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: h * 2.4,
                            horizontal: w * 1.1,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: widget.clr,
                                size: w * 7.3,
                              ),
                              Text(
                                'Pin Location',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w * 4.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(height: h * 2.2),
                _value == 1
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: h * 14.6,
                        width: w * 75.6,
                        child: GoogleMap(
                          //mapType: MapType.normal,
                          //myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(30.375321, 69.345116),
                          ),
                          /*onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },*/
                        ))
                    : Container(),
                SizedBox(height: 20),
                Container(
                  width: w * 50,
                  height: h * 6.7,
                  child: GradientButton(
                    title: "Send Request",
                    fontSize: w * 4,
                    clrs: [widget.clr, widget.clr],
                    onpressed: () async {
                      print(h * 100);
                      print(w * 100);
                      print(date);
                      print(time);
                      print(_value);
                      print(questionController.text);

                      await FirebaseFirestore.instance
                          .collection('demands')
                          .doc(widget.doc['seller_id'])
                          .collection('demand')
                          .doc(widget.doc['doc_id'])
                          .update({
                        "title": widget.doc['title'],
                        "desc": widget.doc['desc'],
                        "question": questionController.text,
                        "price": widget.doc['price'],
                        "seller_location": widget.doc['location'],
                        "seller_image": widget.doc['seller_image'],
                        "date": "${date.day} ${date.month} ${date.year}",
                        "time": time,
                        "location": _value == 1 ? "Physical" : "Virtual",
                        "buyer_name": _currentUser.getCurrentUser.displayName,
                        "buyer_id": _currentUser.getCurrentUser.uid,
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          widget.clr == Colors.blue
              ? OfferAppBar(
                  icon: Icons.arrow_back_ios_outlined,
                  bartitle: 'Request Meet Up',
                  icon3: Icons.security_rounded,
                  name: widget.doc['seller_name'],
                  work: widget.doc['title'],
                  price: widget.doc['price'].toString(),
                  price1: '/30min',
                  picture: widget.doc['seller_image'])
              : OfferAppBarBuyer(
                  icon: Icons.arrow_back_ios_outlined,
                  bartitle: 'Request Meet Up',
                  icon3: Icons.security_rounded,
                  name: widget.doc['seller_name'],
                  work: widget.doc['title'],
                  price: widget.doc['price'].toString(),
                  price1: '/30min',
                  picture: widget.doc['seller_image']),
        ],
      ),
    );
  }
}
