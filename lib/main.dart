import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Providers/location_provider.dart';
import 'package:meeter/View/Auth/register.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_seller.dart';
import 'package:provider/provider.dart';
import 'View/Auth/getting_Started.dart';
import 'package:meeter/Providers/login_validation.dart';
import 'package:meeter/Providers/register_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meeter/Model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: Meeter(),
    ),
  );
}

class Meeter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => LoginValidation()),
        ChangeNotifierProvider(create: (_) => RegisterValidation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meeter',
        routes: {
          "/register": (context) => Register(),
        },
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth _auth;
  UserController _userController;

  saveUsertoSharedPref(String displayName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('userName', displayName);
  }
  //LocationProvider loc = LocationProvider();

  //getLocation() async {
  // await loc.getLocation();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _auth = FirebaseAuth.instance;
      if (_auth.currentUser != null) {
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          _userController = Provider.of<UserController>(context, listen: false);
          OurUser user = await _userController.getCurrentUserInfo();
          // _userController = Provider.of<UserController>(context, listen: false);
          print(user.displayName);
          saveUsertoSharedPref(user.displayName);
        });
      }
      //saveUsertoSharedPref(_userController.getCurrentUser.displayName);
    });
    //getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser != null ? BottomNavBar() : GettingStarted();
  }
}
