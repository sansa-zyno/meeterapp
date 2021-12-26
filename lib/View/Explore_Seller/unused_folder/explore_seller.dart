// import 'package:flutter/material.dart';
// import 'package:meeter/View/Explore_Seller/connection_screen.dart';
// import 'package:meeter/View/Explore_Seller/search_screen.dart';
// import 'package:meeter/Widgets/mainlists.dart';
// import 'package:meeter/Widgets/upcomingMeetings.dart';

// import './../Dashboard/activity.dart';
// import 'chat_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 310,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(30),
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/images/group1.png',
//                     ),
//                     fit: BoxFit.fill,
//                   ),
//                   color: Colors.blue,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Row(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ChatScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(50 / 2),
//                                 ),
//                                 child: Center(
//                                   child: Icon(
//                                     Icons.menu,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.centerRight,
//                             child: Row(
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               ConnectionScreen(),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       height: 50,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(50 / 2),
//                                       ),
//                                       child: Center(
//                                         child: Icon(
//                                           Icons.sync_outlined,
//                                           color: Colors.blue,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               ActivityScreen(),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       height: 50,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(50 / 2),
//                                       ),
//                                       child: Center(
//                                         child: Icon(
//                                           Icons.notifications_outlined,
//                                           color: Colors.blue,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20.0),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Text(
//                               'Welcome Back \n Erik Walters!',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40.0,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20),
//                                   ),
//                                 ),
//                                 hintText: 'Search',
//                                 suffixIcon: IconButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => SearchScreen(),
//                                       ),
//                                     );
//                                   },
//                                   icon: Icon(
//                                     Icons.search_rounded,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Container(
//                 height: 150,
//                 child: UpcomingMeetings(),
//               ),
//               Container(
//                 height: 250,
//                 color: Colors.red,
//                 child: MainLists(
//                   mainText: 'FEATURED DEMAND',
//                   text1: 'UI/UX',
//                   text2: '40+',
//                 ),
//               ),
//               Container(
//                 height: 250,
//                 child: MainLists(
//                   mainText: 'SUGGESTED DEMAND FOR YOU',
//                   text1: 'Photography',
//                   text2: '40+',
//                 ),
//               ),
//               Container(
//                 height: 250,
//                 child: MainLists(
//                   mainText: 'DEMAND NEAR YOU',
//                   text1: 'Photography',
//                   text2: '40+',
//                 ),
//               ),
//               Container(
//                 height: 250,
//                 child: MainLists(
//                   mainText: 'HIGH-VALUE DEMAND',
//                   text1: 'Lorem Ipsum',
//                   text2: '40+',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
