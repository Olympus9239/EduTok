import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/models/user.dart' as model;

class AuthController extends GetxController {

  static AuthController instance=Get.find();
  // We are making it observable by wrapping it with Rx .
  // Observable is basically a stream of events where
  // we can keep track if the value of it been changed or not.
   late  Rx<File?> _pickedImage;
   // using getter to get value of picked image to use elsewhere
  File? get profilePhoto=>_pickedImage.value;
  void pickImage()async{
  final pickImage=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickImage!=null){
    Get.snackbar('Profile Picture', 'You have successfully selected your profile picture');
  }
  _pickedImage=Rx<File?>(File(pickImage!.path));
  }
  // upload to firebase Storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // register the user
  void RegisterUser(
    String userName,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out our user to auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
            name: userName,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downloadUrl);
      fireStore.collection('users').doc(cred.user!.uid).set(user.toJson());
      }else{
        Get.snackbar("Error Creating account", 'Please enter all the fields');
      }
      
    } catch (e) {
      Get.snackbar("Error Creating account", e.toString());
    }

  }
  void loginUser(String email,String password)async{
    try{if(
    email.isNotEmpty &&
        password.isNotEmpty ){
       await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       print('log Success');
    }else{
      Get.snackbar("Error Loggin In", 'Please enter all the fields');

    }

    }catch(e){
      Get.snackbar("Error Logging In", e.toString());

    }
  }
}
