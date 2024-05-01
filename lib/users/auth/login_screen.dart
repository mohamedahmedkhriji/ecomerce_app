import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spacemarket_app/users/auth/signup_screen.dart';
import 'package:http/http.dart' as http;

import '../../admin/admin_login.dart';
import '../../api_connection/api_connectio.dart';
import '../fragments/dashboard_of_fragments.dart';
import '../model/user.dart';
import '../userPreferences/user_preferences.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecuire = true.obs;

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if (res.statusCode ==
          200) //from flutter app the connection with api to server - success
      {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "you are logged-in Successfully.");

          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          //save userInfo to local Storage using Shared Prefrences
          await RememberUserPrefs.saveRememberUser(userInfo);

          Future.delayed(Duration(milliseconds: 2000), () {
            //passage to dashbord take some segends
            Get.to(DashboardOfFragments());
          });
        } else {
          Fluttertoast.showToast(
              msg:
                  "Incorrect Credentials.\nPlease write correct password or email and Try Again.");
        }
      }
    } catch (errorMsg) {
      print("Error :: " + errorMsg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: LayoutBuilder(builder: (context, cons) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: cons.maxHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //login screen header
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(80),
                    ),
                    child: Image.asset(
                      "images/bgstore.jpg",
                    ),
                  ),
                ),

                //Login screen signing form
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 8.0),
                      child: Column(
                        children: [
                          //email,password,button

                          Form(
                            key: formKey,
                            child: Column(
                              children:

                                  //email
                                  [
                                TextFormField(
                                  controller: emailController,
                                  validator: (val) => val == ""
                                      ? "Plaise write email"
                                      : null, //checking if eamil impty or not
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                    ),
                                    hintText: "Enter your Email...",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14.0,
                                      vertical: 6.0,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),

                                const SizedBox(
                                  height: 18.0,
                                ),
                                //passeword
                                Obx(
                                  //afficahe et masque passeword
                                  () => TextFormField(
                                    controller: passwordController,
                                    obscureText: isObsecuire.value,
                                    validator: (val) => val == ""
                                        ? "Plaise write passeword"
                                        : null, //checking if eamil impty or not
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.vpn_key_outlined,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: Obx(
                                        () => GestureDetector(
                                          //for eyes icon to get
                                          onTap: () {
                                            isObsecuire.value =
                                                !isObsecuire.value;
                                          },
                                          child: Icon(
                                            isObsecuire.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      hintText: "Enter your Passeword...",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 14.0,
                                        vertical: 6.0,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18.0,
                                ),

                                //button

                                Material(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: InkWell(
                                    onTap: () {
                                      //valider le forme de login
                                      if (formKey.currentState!.validate()) {
                                        loginUserNow();
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 28.0,
                                      ),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          //dont have account button-button of register

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an Account !"),
                              TextButton(
                                onPressed: () {
                                  Get.to(SignUp_Screen());
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Or",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14.0),
                          ),
                          //admin account-button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Are you an Admin ? "),
                              TextButton(
                                onPressed: () {
                                  Get.to(AdminLoginScreen());
                                },
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
