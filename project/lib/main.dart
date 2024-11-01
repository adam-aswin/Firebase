import 'package:flutter/material.dart';
import 'package:project/MainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/signuppage.dart';
import 'package:project/updatepage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: Mainpage(),
      routes: {
        "/sign": (context) => Signuppage(),
        "/main": (context) => Mainpage(),
        "/update": (context) => Updatepage(),
      },
    ),
  );
}
