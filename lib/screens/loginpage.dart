import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:librix/screens/createacc.dart';
import 'package:librix/screens/home.dart';
import 'package:librix/screens/homescreen.dart';
import 'package:librix/screens/provider.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool value = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final DatabaseReference ref =
      FirebaseDatabase.instance.ref(); // Firebase reference

  // Firebase Auth instance

  // Email Format Validator
  bool isValidEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  Future<void> _signIn() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String username = userNameController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      showMessage("Please enter all details.");
      return;
    } else if (!isValidEmail(email)) {
      showMessage("Please enter a valid email id.");
      return;
    }

    try {
      // Access the "users" node (not child(username))
      DatabaseReference usersRef = ref.child("users");
      DataSnapshot snapshot = await usersRef.get();

      if (snapshot.exists) {
        bool userFound = false;

        Map<dynamic, dynamic> usersMap =
            snapshot.value as Map<dynamic, dynamic>;

        // Iterate all users
        usersMap.forEach((key, value) async {
          String? dbUsername = value['userName'];
          String? dbEmail = value['email'];
          String? dbPassword = value['password'];

          if (dbUsername == username &&
              dbEmail == email &&
              dbPassword == password) {
            userFound = true;

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);
            await prefs.setString('Username', username);
            await prefs.setString('Email', email);
            await prefs.setString('Password', password);

            // update provider
            context.read<UserProvider>().changeUsername(
                  newUsername: username,
                  newPassword: password,
                  newmail: email,
                );

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Homrscreen()),
            );
          }
        });

        // Wait a little and then check if userFound was set
        // Because the forEach async won't block, we'll do a slight delay
        await Future.delayed(Duration(milliseconds: 500));

        if (!userFound) {
          showMessage("Incorrect email or password.");
        }
      } else {
        showMessage("No users found.");
      }
    } catch (e) {
      print("Login Error: $e");
      showMessage("Something went wrong. Try again.");
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  var facebookurl = "https://en-gb.facebook.com/login/web/";
  var Googleurl = "https://www.google.co.in/";

  Future<void> _launcherUrlfacebook() async {
    final Uri url = Uri.parse(facebookurl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "error in the url: $facebookurl";
    }
  }

  Future<void> _launcherUrlgoogle() async {
    final Uri url = Uri.parse(Googleurl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "error in the url: $Googleurl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              "assets/image4.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
          ),
          Positioned(
              child: Opacity(
            opacity: 0.6,
            child: Center(
              child: Stack(children: [
                Container(
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Login",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: userNameController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Username",
                                labelStyle: GoogleFonts.alike(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                hintText: "username",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Email",
                                labelStyle: GoogleFonts.alike(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                hintText: "Email",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Password",
                              labelStyle: GoogleFonts.alike(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              hintText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () async {
                              await _signIn();
                              userNameController.clear();

                              emailcontroller.clear();
                              passwordcontroller.clear();
                            },
                            child: Text("Login",
                                style: GoogleFonts.alike(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        backgroundColor: const Color.fromARGB(
                                            255, 8, 107, 188)),
                                    onPressed: () {
                                      _launcherUrlfacebook();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          color: Colors.white,
                                        ),
                                        Text("Facebook",
                                            style: GoogleFonts.alike(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)))
                                      ],
                                    )),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        backgroundColor: const Color.fromARGB(
                                            255, 227, 14, 103)),
                                    onPressed: () {
                                      _launcherUrlgoogle();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.g_mobiledata,
                                          color: Colors.white,
                                        ),
                                        Text("Google",
                                            style: GoogleFonts.alike(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)))
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Center(
                            child: Row(
                              children: [
                                Text("Don't have an account?",
                                    style: GoogleFonts.alike(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateAcc()));
                                    },
                                    child: Text("Create Account",
                                        style: GoogleFonts.alike(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          )),
        ]));
  }
}
