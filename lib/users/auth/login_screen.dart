import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemarket_app/users/auth/signup_screen.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isObsecuire = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
                  height: 285.0,
                  child: Image.asset(
                    "images/background.png",
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
                            key: formkey,
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
                                    controller: passController,
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
                                    onTap: () {},
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
                                onPressed: () {},
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
