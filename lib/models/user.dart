import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;
  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };
  //Getting data from FireStore using Stream and Map it to Class Flutter
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        name: snapshot['name'],
        profilePhoto: snapshot['profilePhoto'],
        email: snapshot['email'],
        uid: snapshot['uid']);
  }
}
