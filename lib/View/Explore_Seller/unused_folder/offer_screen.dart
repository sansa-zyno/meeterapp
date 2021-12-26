/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_Seller/request_offer_screen.dart';

class OfferDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    String offerValue = '';

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: AlertDialog(
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'abc is selling it for \$2760',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 10,
                width: double.infinity,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.black,
                  cursorHeight: 30,
                  style: TextStyle(
                    fontSize: 37,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'You are offering',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontSize: 35,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: '\$2773',
                    hintStyle: TextStyle(
                      fontSize: 37,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onChanged: (value) {
                    offerValue = value;
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 90,
                  vertical: 10,
                ),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            child: Text(
              'Make Offer',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestOffer(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}*/
