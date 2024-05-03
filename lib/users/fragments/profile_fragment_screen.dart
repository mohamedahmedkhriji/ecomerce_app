import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemarket_app/users/authentication/login_screen.dart';
import 'package:spacemarket_app/users/userPreferences/current_user.dart';
import 'package:spacemarket_app/users/userPreferences/user_preferences.dart';

class ProfileFragmentScreen extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Logout",
          style: TextStyle(
            fontFamily: 'Yes',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Are you sure?",
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  fontFamily: 'Yes',
                  fontSize: 20,
                  color: Colors.red,
                ),
              )),
          TextButton(
              onPressed: () {
                Get.back(result: "loggedOut");
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontFamily: 'Yes',
                  fontSize: 20,
                  color: Colors.green,
                ),
              )),
        ],
      ),
    );

    if (resultResponse == "loggedOut") {
      //delete-remove the user data from phone local storage
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(LoginScreen());
      });
    }
  }

  Widget userInfoItemProfile(
      IconData iconData, String userData, Color textColor) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 30,
                color: Colors.black,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                userData,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 120, // half of the width
              backgroundImage: AssetImage("images/man.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        userInfoItemProfile(
            Icons.person, _currentUser.user.user_name, Colors.black),
        const SizedBox(
          height: 20,
        ),
        userInfoItemProfile(
            Icons.email, _currentUser.user.user_email, Colors.black),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontFamily: 'Dach',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
