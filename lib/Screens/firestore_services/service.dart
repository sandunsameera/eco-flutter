import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogApp_Design/BuyingAndSellign/Services/data_handling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirestoreServices {
  final storage = new FlutterSecureStorage();
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addtosell(dogDetails) async {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("Selling platform")
          .add(dogDetails)
          .catchError((e) {
        print(e);
      });
    } else {
      print("Log in first fucker");
    }
  }

  Future<void> addtocross(dogDetails) async {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("Challanges")
          .add(dogDetails)
          .catchError((e) {
        print(e);
      });
    } else {
      print("Log in first fucker");
    }
  }

  getsellingCHallanges() async {
    return await Firestore.instance
        .collection("Selling platform")
        .getDocuments();
  }

  getcrossingCHallanges() async {
    return await Firestore.instance
        .collection("Crossing CHallanges")
        .getDocuments();
  }

  getCHallangesbybreed(String breed) async {
    return await Firestore.instance
        .collection("Selling platform")
        .where("breed", isEqualTo: breed)
        .getDocuments();
  }

  getCHallangesbybreedCross(String breed) async {
    return await Firestore.instance
        .collection("Crossing CHallanges")
        .where("breed", isEqualTo: breed)
        .getDocuments();
  }

  createChatRoom(String chatroomId, chatroomMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatroomId)
        .setData(chatroomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getConversationMsgs(String chatroomID) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .document(chatroomID)
        .collection("Chats")
        .orderBy('time')
        .snapshots();
  }

  addConversationMsgs(String chatroomID, massageMap) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .document(chatroomID)
        .collection("Chats")
        .add(massageMap)
        .catchError((e) {
      print(e);
    });
  }

  getChatTHreads(String username) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .where("Users", arrayContains: username)
        .snapshots();
  }

  getuid() async {
    String value = await storage.read(key: "userId");
    DataHandle.uid = value;
    return value;
  }

  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("Users")
        .where("email", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e);
    });
  }

  deletePostedAds(dataId) async {
    await Firestore.instance.runTransaction((Transaction myTransaction) async {
      await myTransaction.delete(dataId);
    });
  }
}
