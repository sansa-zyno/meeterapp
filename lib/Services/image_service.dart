import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeter/Services/database.dart';
import 'package:uuid/uuid.dart';

class ImageService {
  /*Future<String> uploadImageToStorage(File imageFile) async {
    // mention try catch later on

    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().millisecondsSinceEpoch}');
      StorageUploadTask storageUploadTask =
          _storageReference.putFile(imageFile);
      var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
      // print(url);
      return url;
    } catch (e) {
      return null;
    }
  }*/

  Future<String> getImage() async {
    String urlImage;
    try {
      ImagePicker imagePicker = ImagePicker();
      PickedFile image = await imagePicker.getImage(
          source: ImageSource.gallery, imageQuality: 25);
      String fileName = '${DateTime.now().toString()}.png';

      if (image != null) {
        ///Saving Pdf to firebase
        Reference reference = FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = reference.putData(await image.readAsBytes());
        urlImage = await (await uploadTask).ref.getDownloadURL();
      }
      return urlImage;
    } catch (e) {
      return null;
    }
  }

  void setImageMsg(String url, String chatRoomId, String username) async {
    var lastMessageTs = DateTime.now();
    Map<String, dynamic> messageInfoMap = {
      "type": 'image',
      "photoUrl": url,
      "sendBy": username,
      "ts": lastMessageTs,
    };

    String messageId = Uuid().v4();

    Database().addMessage(chatRoomId, messageId, messageInfoMap).then((value) {
      Map<String, dynamic> lastMessageInfoMap = {
        "type": 'image',
        "lastMessage": url,
        "lastMessageSendTs": lastMessageTs,
        "lastMessageSendBy": username
      };
      Database().updateLastMessageSend(chatRoomId, lastMessageInfoMap);
    });
  }

  void uploadImage(String chatRoomId, String username) async {
    // Set some loading value to db and show it to user
    //imageUploadProvider.setToLoading();

    // Get url from the image bucket
    String url = await getImage();

    setImageMsg(url, chatRoomId, username);
  }
}
