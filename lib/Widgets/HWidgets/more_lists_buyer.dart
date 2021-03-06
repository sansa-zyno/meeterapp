import 'package:flutter/material.dart';
import 'package:meeter/Model/demand_data.dart';
import 'package:meeter/View/Explore_buyer/detail_buyer_screen.dart';

class MoreListsBuyer extends StatelessWidget {
  final String picture;
  final List<List<DemandData>> demandsCollections;
  MoreListsBuyer({this.picture, this.demandsCollections});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    List<DemandData> demandsCollection =
        demandsCollections.expand((x) => x).toList();
    return Column(
      children: <Widget>[
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 16),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: demandsCollection.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 1.5,
                vertical: h * 1.2,
              ),
              child: GestureDetector(
                child: Container(
                  height: w * 30,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                          height: w * 28,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              demandsCollection[index].demand_bannerImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(w * 1.5),
                          child: Text(
                            demandsCollection[index].demand_title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(w * 1.1),
                          child: Text(
                            "\$${demandsCollection[index].demand_price} per 30min",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsBuyerScreen(demandsCollection[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
