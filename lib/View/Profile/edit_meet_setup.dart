import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeter/Controller/user_controller.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:meeter/Widgets/progressBtn/flutter_progress_button.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:meeter/View/Profile/const/size_const.dart';
import 'package:meeter/Widgets/TextWidgets/rounded_textfield.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';

class EditMeetSetup extends StatefulWidget {
  final DocumentSnapshot doc;
  EditMeetSetup(this.doc);
  _EditMeetSetupState createState() => _EditMeetSetupState();
}

class _EditMeetSetupState extends State<EditMeetSetup> {
  TextEditingController meetTitle = TextEditingController();
  TextEditingController meetDescription = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController location = TextEditingController();
  String postId = Uuid().v4();

  //String myName = "";
  //String myUsername = "";
  //String gender = "Male";
  //DateTime dateTime;
  List tags = [];

  UserController _currentUser;

  bool value = false;

  File _image;
  String _bannerImage = '';

  Future getImage() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 1920, maxHeight: 1080);

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
  void initState() {
    // TODO: implement initState
    super.initState();
    meetTitle = TextEditingController(text: widget.doc['meetup_title']);
    meetDescription =
        TextEditingController(text: widget.doc['meetup_description']);
    location = TextEditingController(text: widget.doc['meetup_location']);
    priceController =
        TextEditingController(text: widget.doc['meetup_price'].toString());
    _bannerImage = widget.doc['meetup_bannerImage'];
    tags = widget.doc['meetup_tags'];
    value = widget.doc['meetup_available_online'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                            child: Image.network(
                              _bannerImage,
                              fit: BoxFit.fill,
                            ))
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
                            child: RoundedTextField(
                              hint: "Enter the title of your meet up",
                              type: TextInputType.text,
                              obsecureText: false,
                              icon: Icon(
                                Icons.badge,
                                color: Color(0xff00AEFF),
                              ),
                              iconColor: Colors.cyan,
                              label: "Meetup Title",
                              controller: meetTitle,
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
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              controller: meetDescription,
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
                                  hintText: 'Enter Meet up description',
                                  labelText: "Meetup Description",
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
                              hint: "Price per 30 minutes",
                              type: TextInputType.number,
                              obsecureText: false,
                              icon: Icon(Icons.settings_voice,
                                  color: Color(0xff00AEFF)),
                              iconColor: Colors.cyan,
                              label: "Price",
                              controller: priceController,
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
                              hint: "Enter Location",
                              type: TextInputType.text,
                              obsecureText: false,
                              icon: Icon(
                                Icons.location_pin,
                                color: Color(0xff00AEFF),
                              ),
                              iconColor: Colors.cyan,
                              label: "Preferred Location",
                              controller: location,
                              onChange: (text) {},
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
                        initialTags: tags.map((e) => e.toString()).toList(),
                        textFieldStyler: TextFieldStyler(
                            textStyle:
                                TextStyle(fontFamily: "poppins", fontSize: 14),
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
                      title: "Update",
                      fontSize: 12,
                      clrs: [Color(0xff00AEFF), Color(0xff00AEFF)],
                      onpressed: () async {
                        await updateDataToDb();
                        Navigator.pop(context);
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
          MeeterAppbar(
            title: "Edit Meet Setup",
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
        .collection('meeter')
        .doc(widget.doc.id)
        .update({
      "meetup_title": meetTitle.text,
      "meetup_description": meetDescription.text,
      "meetup_price": priceController.text,
      "meetup_location": location.text,
      //"meetup_likes": 0,
      "meetup_available_online": value,
      "meetup_seller_uid": _currentUser.getCurrentUser.uid,
      "meetup_seller_name": _currentUser.getCurrentUser.displayName,
      "meetup_seller_image": _currentUser.getCurrentUser.avatarUrl,
      "meetup_bannerImage": _bannerImage,
      "meetup_tags": tags
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
