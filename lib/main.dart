import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/controller/auth_controller.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';
import 'package:tiktokclone/views/screens/auth/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EduTok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home:LoginScreen(),
    );
  }
}

