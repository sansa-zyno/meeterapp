import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeter/Providers/user_controller.dart';
import 'package:meeter/Widgets/HWidgets/nav_main_seller.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:meeter/Widgets/progressBtn/flutter_progress_button.dart';
import 'package:meeter/Providers/application_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:meeter/View/Profile/const/size_const.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';

class MeetSetup extends StatefulWidget {
  _MeetSetupState createState() => _MeetSetupState();
}

class _MeetSetupState extends State<MeetSetup> {
  TextEditingController meetTitle = TextEditingController();
  TextEditingController meetDescription = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController location = TextEditingController();
  String postId = Uuid().v4();
  final _formKey = GlobalKey<FormState>();
  final _scacffoldKey = GlobalKey<ScaffoldState>();

  //String myName = "";
  //String myUsername = "";
  //String _currentLocation = "Your Country";
  //String gender = "Male";
  //DateTime dateTime;
  List<String> tags = [];

  UserController _currentUser;
  ApplicationBloc applicationBloc;

  bool value = false;

  File _image;
  String _bannerImage = '';

  Future getImage() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 25);

    String fileName = '${DateTime.now().toString()}.png';

    if (image != null) {
      ///Saving Pdf to firebase
      Reference reference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = reference.putData(image.readAsBytesSync());
      String urlImage = await (await uploadTask).ref.getDownloadURL();

      setState(() {
        _image = image;
        _bannerImage = urlImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;
    _currentUser = Provider.of<UserController>(context);
    applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    print(_currentUser.getCurrentUser.uid);

    return Scaffold(
      key: _scacffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                    ),

                    // StreamBuilder<DocumentSnapshot>(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("users")
                    //         .doc(myUser.uid)
                    //         .snapshots(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         Map<String, dynamic> data = snapshot.data.data();
                    //         if (data.containsKey("avatarUrl")) {
                    //           myUser.avatarUrl = data["avatarUrl"];
                    //         }
                    //       }
                    //       return
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: PoppinsText(
                        text: "Upload a banner picture for your meet-up",
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: h * 4.2217,
                    ),
                    GestureDetector(
                      child: _image == null
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff00AEFF), width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset("assets/images/image.png"),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                height: 150,
                                width: MediaQuery.of(context).size.width * 0.80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff00AEFF), width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      onTap: () {
                        getImage();
                      },
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
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter the title of your meet up",
                                  labelText: "Meetup Title",
                                ),
                                controller: meetTitle,
                                validator: (value) {
                                  if (value == "") {
                                    return "This field must not be empty.";
                                  }
                                  return null;
                                },
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
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: "Enter Meet up description",
                                  labelText: "Meetup Description",
                                ),
                                controller: meetDescription,
                                validator: (value) {
                                  if (value == "") {
                                    return "This field must not be empty.";
                                  }
                                  return null;
                                },
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
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Price per 30 minutes",
                                  labelText: "Price",
                                ),
                                controller: priceController,
                                validator: (value) {
                                  if (value == "") {
                                    return "This field must not be empty.";
                                  }
                                  return null;
                                },
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
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Location",
                                  labelText: "Preferred Location",
                                ),
                                controller: location,
                                validator: (value) {
                                  if (value == "") {
                                    return "This field must not be empty.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: h * 4.2217,
                    // ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          this.value = !value;
                        });
                      },
                      leading: Checkbox(
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        },
                      ),
                      title: Text(
                        'Available for online meet-up',
                        style: TextStyle(fontFamily: "poppins", fontSize: 14),
                      ),
                    ),
                    // SizedBox(
                    //   height: h * 4.2217,
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFieldTags(
                          initialTags: tags,
                          textFieldStyler: TextFieldStyler(
                              textStyle: TextStyle(
                                  fontFamily: "poppins", fontSize: 14),
                              hintText: "Add Category tags min 8",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              textFieldBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              textFieldEnabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff00AEFF), width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              textFieldFocusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff00AEFF), width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              textFieldFilledColor: Color(0xff00AEFF)

                              // bool textFieldFilled = false,
                              // String helperText = 'Enter tags',
                              // TextStyle helperStyle,
                              // String hintText = 'Got tags?',
                              // TextStyle hintStyle,
                              // EdgeInsets contentPadding,
                              // Color textFieldFilledColor,
                              // bool isDense = true,
                              // bool textFieldEnabled = true,
                              // OutlineInputBorder textFieldBorder = const OutlineInputBorder(),
                              // OutlineInputBorder textFieldFocusedBorder,
                              // OutlineInputBorder textFieldDisabledBorder,
                              // OutlineInputBorder textFieldEnabledBorder
                              ),
                          tagsStyler: TagsStyler(
                            tagPadding: EdgeInsets.all(
                              5.0,
                            ),
                            tagDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            //These are properties you can tweek for customization

                            // showHashtag = false,
                            // EdgeInsets tagPadding = const EdgeInsets.all(4.0),
                            // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
                            // BoxDecoration tagDecoration = const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
                            // TextStyle tagTextStyle,
                            // Icon tagCancelIcon = const Icon(Icons.cancel, size: 18.0, color: Colors.green)
                          ),
                          onTag: (tag) {
                            tags.add(tag);
                            setState(() {});
                          },
                          onDelete: (tag) {
                            tags.remove(tag);
                            setState(() {});
                          }),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.85,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Color(0xff00AEFF), width: 1),
                    //       borderRadius: BorderRadius.circular(30)),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: <Widget>[
                    //       Align(
                    //         alignment: Alignment.centerLeft,
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 40.0, vertical: 15),
                    //           child: GestureDetector(
                    //             child: Icon(
                    //               Icons.event,
                    //               color: Color(0xff00AEFF),
                    //             ),
                    //             onTap: () async {
                    //               DateTime newDateTime = await showRoundedDatePicker(
                    //                 context: context,
                    //                 firstDate: DateTime.now(),
                    //                 lastDate: DateTime(DateTime.now().year + 10),
                    //                 borderRadius: 16,
                    //               );
                    //               if (newDateTime != null) {
                    //                 setState(() => dateTime = newDateTime);
                    //               }
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.center,
                    //         child: dateTime != null
                    //             ? Text(
                    //                 "${dateTime.day.toString().padLeft(2, '0') ?? "?"}, ${DateFormat("MMMM").format(dateTime ?? "?")} ${dateTime.year.toString() ?? "?"}",
                    //                 textAlign: TextAlign.center,
                    //               )
                    //             : Text("AGE"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: h * 4.2217,
                    ),
                    Container(
                      width: 270,
                      height: 50,
                      child: GradientButton(
                        title: "Go",
                        fontSize: 12,
                        clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                        onpressed: () async {
                          if (_bannerImage != "" &&
                              _formKey.currentState.validate()) {
                            await updateDataToDb();
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(_currentUser.getCurrentUser.uid)
                                .update({"meetSetup": true});

                            print("yyyyyyyyyyy");

                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: BottomNavBar(),
                              ),
                            );
                          } else {
                            _scacffoldKey.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  'All fields are compulsory except the tags field which is optional'),
                            ));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * 4.2217,
                    ),
                  ],
                ),
              ),
            ),
          ),
          MeeterAppbar(
            title: "Meet Setup",
            icon: Icons.arrow_back_rounded,
          ),
        ],
      ),
    );
  }

  Widget fieldColorBox(Gradient gradient, String title, String text,
      TextEditingController controller, List<TextInputFormatter> input) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return Padding(
      padding: EdgeInsets.only(
        left: w * 7.63888,
        right: w * 7.63888,
        bottom: h * 0.99547,
      ),
      child: Container(
        height: h * 7.466,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.purple,
              blurRadius: 5,
              offset: Offset(0.1, 0.1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: w * 7.6388,
            ),
            Expanded(
              flex: 2,
              child: Wrap(
                children: <Widget>[
                  MediaQuery(
                    data: mqDataNew,
                    child: TextField(
                      inputFormatters: input,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: text,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: TEXT_NORMAL_SIZE,
                          color: Colors.grey,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateDataToDb() async {
    await FirebaseFirestore.instance
        .collection("meeters")
        .doc(_currentUser.getCurrentUser.uid)
        .set({"m": "m"});

    await FirebaseFirestore.instance
        .collection("meeters")
        .doc(_currentUser.getCurrentUser.uid)
        .collection('meeter')
        .add({
      "featured": false,
      "meetup_title": meetTitle.text,
      "meetup_description": meetDescription.text,
      "meetup_price": int.parse(priceController.text),
      "meetup_location": location.text,
      "meetup_likes": 0,
      "meetup_available_online": value,
      "meetup_seller_uid": _currentUser.getCurrentUser.uid,
      "meetup_seller_name": _currentUser.getCurrentUser.displayName,
      "meetup_seller_image": _currentUser.getCurrentUser.avatarUrl,
      "meetup_bannerImage": _bannerImage,
      "meetup_tags": tags,
      "lat": applicationBloc.currentLocation.latitude,
      "long": applicationBloc.currentLocation.longitude,
    });
  }

  Widget nexButton(String text, BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    final h = MediaQuery.of(context).size.height / 100;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: w * 20.731, vertical: h * 6.2217),
      child: Builder(
        builder: (context) {
          return ProgressButton(
            borderRadius: 30,
            color: Color(0xff8B78F7),
            animate: false,
            defaultWidget: PoppinsText(
              text: "Next",
              fontWeight: FontWeight.w900,
              clr: Colors.white,
            ),
            progressWidget: SpinKitThreeBounce(
              color: Colors.white,
              size: w * 5.0925,
            ),
            width: double.infinity,
            height: 5 * h,
            onPressed: () {},
          );
        },
      ),
    );
  }
}
