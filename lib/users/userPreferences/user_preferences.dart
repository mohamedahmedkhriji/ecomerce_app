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

  //get-read User-info
  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }

  static Future<void> removeUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}
