import 'package:flutter/material.dart';
import 'package:medicine_reminder/homepage.dart';
import 'package:medicine_reminder/service/login.dart';
import 'package:medicine_reminder/service/start.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: StartPage(),
    );
  }
}
