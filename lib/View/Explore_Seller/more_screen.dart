import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/HWidgets/more_list.dart';

class MoreScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> meetersCollection;
  MoreScreen(this.meetersCollection);
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
                MoreLists(
                  meetersCollection: widget.meetersCollection,
                ),
              ],
            ),
          ),
          MeeterAppbar(
            title: "More Products",
            icon: Icons.arrow_back_ios_outlined,
          ),
        ],
      ),
    );
  }
}
