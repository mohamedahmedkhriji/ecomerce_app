import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class RememberUserPrefs {
  //save-remember User-info
  static Future<void> saveRememberUser(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences
        .getInstance(); //creat istance for shared to save data
    String userJsonData = jsonEncode(userInfo.toJson()); //set local data
    await preferences.setString(
        "currentUser", userJsonData); //user already signup
  }
}
