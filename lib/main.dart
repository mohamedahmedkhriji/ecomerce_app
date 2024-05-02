import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemarket_app/users/authentication/login_screen.dart';
import 'package:spacemarket_app/users/fragments/dashboard_of_fragments.dart';
import 'package:spacemarket_app/users/userPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        // to save user login
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot) {
          if (dataSnapShot.data == null) {
            return LoginScreen();
          } else {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
