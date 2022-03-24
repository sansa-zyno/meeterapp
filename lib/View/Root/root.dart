import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meeter/View/Explore_Seller/home_screen.dart';
import 'package:meeter/View/Profile/meet_setup.dart';
import 'package:provider/provider.dart';
import 'package:meeter/Providers/user_controller.dart';
import 'package:meeter/Enums/authStatus.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/View/Profile/profile_setup.dart';
import 'package:meeter/View/Auth/getting_Started.dart';
import 'package:meeter/View/Profile/about_you_setup.dart';
import 'package:meeter/View/Profile/love.dart';
import 'package:meeter/View/Profile/interested_in_selling.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.authenticating;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    UserController _currentUser = Provider.of<UserController>(context);
    OurUser myUser = _currentUser.getCurrentUser;

    if (_currentUser.getCurrentUser.uid == null) {
      _authStatus = AuthStatus.notLoggedIn;
    } else if (myUser.uid != null) {
      if (myUser.displayName == null) {
        _authStatus = AuthStatus.noProfile;
      } else if (myUser.about != null || myUser.about == false) {
        _authStatus = AuthStatus.noAbout;
      } else if (myUser.interests != null || myUser.interests == false) {
        _authStatus = AuthStatus.noInterest;
      } else if (myUser.isSelling == null) {
        _authStatus = AuthStatus.sellingNull;
      } else if (myUser.isSelling == true && myUser.meetSetup == false ||
          myUser.meetSetup == null) {
        _authStatus = AuthStatus.noMeetSetup;
      } else {
        _authStatus = AuthStatus.loggedInhome;
      }
    }

    switch (_authStatus) {
      case AuthStatus.authenticating:
        return Scaffold(body: CircularProgressIndicator());
        break;
      case AuthStatus.noProfile:
        return ProfileSetup();
        break;
      case AuthStatus.notLoggedIn:
        return GettingStarted();
        break;
      case AuthStatus.noAbout:
        return YouSetup();
        break;
      case AuthStatus.noInterest:
        return LoveSetup();
        break;
      case AuthStatus.sellingNull:
        return InterestedSelling();
        break;
      case AuthStatus.noMeetSetup:
        return MeetSetup();
        break;
      case AuthStatus.loggedInhome:
        return HomeScreen();
        break;
      default:
    }
  }
}
