import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemarket_app/users/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Space Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
        builder: (context, dataSnapshot) {
          return Login_Screen();
        },
        future: null,
      ),
    );
  }
}
