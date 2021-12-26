import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar_buyer.dart';
import 'package:meeter/Widgets/HWidgets/more_lists_buyer.dart';

class MoreBuyerScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> meeters2Collection;
  MoreBuyerScreen(this.meeters2Collection);
  @override
  _MoreBuyerScreenState createState() => _MoreBuyerScreenState();
}

class _MoreBuyerScreenState extends State<MoreBuyerScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 100),
                MoreListsBuyer(
                  meeters2Collection: widget.meeters2Collection,
                ),
              ],
            ),
          ),
          MeeterAppbarBuyer(
            title: "More Products",
            icon: Icons.arrow_back_ios_outlined,
          ),
        ],
      ),
    );
  }
}
