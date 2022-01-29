// COLORS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/controller/auth_controller.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;


// FireBase

var firebaseAuth=FirebaseAuth.instance;
var firebaseStorage=FirebaseStorage.instance;
var fireStore=FirebaseFirestore.instance;

// authController

var authController=AuthController.instance;