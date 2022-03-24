import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String phone;
  String displayName;
  String country;
  String avatarUrl;
  String userType;
  bool about;
  bool interests;
  bool isSelling;
  bool meetSetup;
  String bannerImage;
  String verified;
  String age;
  String bio;
  String occupation;
  Timestamp accountCreated;

  OurUser(
      {this.accountCreated,
      this.phone,
      this.uid,
      this.avatarUrl,
      this.country,
      this.displayName,
      this.userType,
      this.verified,
      this.bio,
      this.age,
      this.about,
      this.interests,
      this.isSelling,
      this.meetSetup,
      this.bannerImage,
      this.occupation});

  factory OurUser.fromFireStore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data();
    return OurUser(
        uid: _data["uid"],
        phone: _data["phoneNumber"] ?? "",
        age: _data["age"] ?? "",
        displayName: _data["displayName"] ?? "",
        country: _data["country"] ?? "",
        avatarUrl: _data["avatarUrl"] ?? "",
        accountCreated: _data["accountCreated"],
        userType: _data["userType"] ?? "",
        verified: _data["verified"] ?? "",
        bio: _data["bio"] ?? "",
        occupation: _data["occupation"] ?? "",
        about: _data["userAbout"] ?? false,
        interests: _data["userInterests"] ?? false,
        isSelling: _data["isSelling"] ?? false,
        meetSetup: _data["meetSetup"] ?? false,
        bannerImage: _data["bannerImage"] ?? "");
  }
}
