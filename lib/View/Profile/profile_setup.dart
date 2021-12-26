import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:image/image.dart' as Im;
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Model/user.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:strings/strings.dart';
import 'package:meeter/Widgets/TextWidgets/rounded_textfield.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:meeter/Widgets/LangSelector/langSelector.dart';
import 'package:page_transition/page_transition.dart';
import 'package:meeter/View/Profile/youAre.dart';

class ProfileSetup extends StatefulWidget {
  _ProfileSetupState createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  String postId = Uuid().v4();
  String country = "";
  String myName = "";
  String gender = "Male";
  DateTime dateTime;
  List langDynamicSelector;

  List<String> count = [
    "First",
    "Second",
    "Third",
    "Fourth",
    "Fifth",
    "Sixth",
    "Seventh",
    "Eightth",
    "Nineth",
    "Tenth"
  ];

  UserController _currentUser;

  List<Widget> langSelector = [
    LangSelector(
      ith: "First",
    )
  ];

  /*updateFailedSnackBar(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Username Already Exists",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w900,
            fontSize: 4 * w,
          ),
          textScaleFactor: 1,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }*/

  /* dpFailedSnackBar(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Display Picture Not Uploaded !",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w900,
            fontSize: 4 * w,
          ),
          textScaleFactor: 1,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    langDynamicSelector = langSelector;
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    _currentUser = Provider.of<UserController>(context);

    print(_currentUser.getCurrentUser.uid);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                  ),

                  StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(_currentUser.getCurrentUser.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data = snapshot.data.data();
                          if (data.containsKey("avatarUrl")) {
                            _currentUser.getCurrentUser.avatarUrl =
                                data["avatarUrl"];
                          }
                        }
                        return CircularProfileAvatar(
                          _currentUser.getCurrentUser.avatarUrl ?? "",
                          backgroundColor: Color(0xffDCf0EF),
                          initialsText: Text(
                            "+",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w900,
                                fontSize: w * 7.6388,
                                color: Color(0xff00AEFF)),
                          ),
                          cacheImage: true,
                          borderWidth: 2,
                          elevation: 10,
                          radius: w * 12.7314,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => AssetGiffyDialog(
                                      buttonOkText: Text(
                                        "Choose From Gallery",
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      image: Image.asset(
                                        "assets/gifs/1.gif",
                                        fit: BoxFit.cover,
                                      ),
                                      entryAnimation: EntryAnimation.TOP_LEFT,
                                      buttonOkColor: Color(0xff8D4BF5),
                                      title: Text(
                                        'Upload your Picture',
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      description: Text(
                                        'It is highly advised to use your own image as a profile picture. Other people will see this photo in thier explore section. Our team will review your account based on this image.',
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1,
                                        style: TextStyle(fontFamily: "Nunito"),
                                      ),
                                      onOkButtonPressed: () async {
                                        await UserController().updateAvatar(
                                            _currentUser.getCurrentUser.uid);
                                        Navigator.of(context).pop();
                                      },
                                    ));
                          },
                        );
                      }),

                  // }),
                  SizedBox(
                    height: h * 4.2217,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Hero(
                              tag: "Name",
                              child: RoundedTextField(
                                hint: "Name",
                                type: TextInputType.text,
                                obsecureText: false,
                                icon: Icon(
                                  Icons.badge,
                                  color: Color(0xff00AEFF),
                                ),
                                iconColor: Colors.cyan,
                                label: "Name",
                                controller: nameController,
                                onChange: (text) {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 4.2217,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              controller: bioController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff00AEFF), width: 2.0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff00AEFF), width: 1.0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  hintText:
                                      'Enter a short description of yourself',
                                  labelText: "Bio",
                                  labelStyle: TextStyle(
                                    fontFamily: "Nunito",
                                  ),
                                  hintStyle: TextStyle(fontFamily: "Nunito")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 4.2217,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: RoundedTextField(
                              hint: "Occupation",
                              type: TextInputType.text,
                              obsecureText: false,
                              icon: Icon(Icons.work_outline_rounded,
                                  color: Color(0xff00AEFF)),
                              iconColor: Colors.cyan,
                              label: "Occupation",
                              controller: occupationController,
                              onChange: (text) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 4.2217,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: RoundedTextField(
                              hint: "Age",
                              type: TextInputType.number,
                              obsecureText: false,
                              icon: Icon(
                                Icons.event,
                                color: Color(0xff00AEFF),
                              ),
                              iconColor: Colors.cyan,
                              label: "Age",
                              controller: ageController,
                              onChange: (text) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 4.2217,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: RoundedTextField(
                              hint: "Country",
                              type: TextInputType.text,
                              obsecureText: false,
                              icon: Icon(Icons.location_pin,
                                  color: Color(0xff00AEFF)),
                              iconColor: Colors.cyan,
                              label: "Country",
                              controller: countryController,
                              onChange: (text) {
                                setState(() {
                                  country = text;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ListView(
                    shrinkWrap: true,
                    children: langSelector,
                    addAutomaticKeepAlives: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  GestureDetector(
                    child: PoppinsText(
                      text: "Add more languages +",
                      clr: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        langSelector = [
                          ...langSelector,
                          new LangSelector(
                            ith: count[langSelector.length],
                          )
                        ];

                        langDynamicSelector = langSelector;
                      });
                    },
                  ),
                  SizedBox(
                    height: h * 2.2217,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: PoppinsText(
                      text: "Upload a banner picture for your profile",
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: h * 4.2217,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(_currentUser.getCurrentUser.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data = snapshot.data.data();
                          if (data.containsKey("bannerImage")) {
                            _currentUser.getCurrentUser.bannerImage =
                                data["bannerImage"];
                          }
                        }
                        return _currentUser.getCurrentUser.bannerImage == null
                            ? GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff00AEFF), width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                                onTap: () {
                                  _currentUser.updateBanner(
                                      _currentUser.getCurrentUser.uid, "users");
                                },
                              )
                            : GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff00AEFF), width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.network(
                                    _currentUser.getCurrentUser.bannerImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  _currentUser.updateBanner(
                                      _currentUser.getCurrentUser.uid, "users");
                                },
                              );
                      }),

                  SizedBox(
                    height: h * 4.2217,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: Hero(
                      tag: "Login",
                      child: GradientButton(
                        title: "Finish Setting Up",
                        clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                        onpressed: () {
                          updateDataToDb();
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: YouSetup()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MeeterAppbar(
            title: "Profile Setup",
            icon: Icons.arrow_back_rounded,
          ),
        ],
      ),
    );
  }

  updateDataToDb() async {
    UserController().updateDisplay(camelize(nameController.text));
    UserController().updateAge(ageController.text);
    UserController().updateOccupation(occupationController.text);
    FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.getCurrentUser.uid)
        .update({
      "bio": bioController.text,
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.getCurrentUser.uid)
        .update({
      "country": countryController.text,
    });

    for (int i = 0; i <= langSelector.length; i++) {
      await FirebaseFirestore.instance
          .collection("language")
          .doc(_currentUser.getCurrentUser.uid)
          .set({
        "${langDynamicSelector[i].ith}Langauge":
            "${langDynamicSelector[i].getcurrentLanguage}",
        "${langDynamicSelector[i].ith}Proficiency":
            "${langDynamicSelector[i].getcurrentProf}",
      }, SetOptions(merge: true));
    }

    // await _currentUser.updateUsername(myUsername);
    // await _currentUser.updateGender(gender);
    await _currentUser.updatePushNotifications(true);
  }
}
