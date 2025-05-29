import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/screens/loginpage.dart';

class CreateAcc extends StatefulWidget {
  CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _NameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  void register(BuildContext context) async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _NameController.text.isEmpty) {
      showMessage("Please enter all details.");
      return;
    } else if (isValidEmail(_emailController.text) == true) {
      if (_passwordController.text == _confirmPasswordController.text) {
        try {
          await ref.child("users").push().set({
            "userName": _NameController.text,
            "email": _emailController.text,
            "password": _passwordController.text,
          });

          // Optional: show success dialog or navigate
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Account created successfully,Please login"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ));
                    },
                    child: Text("Okay"))
              ],
            ),
          );
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error: ${e.toString()}"),
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Password does not match"),
          ),
        );
      }
    } else {
      showMessage("Please enter a valid email id.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Image.asset(
            "assets/image4.jpeg",
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: 0.85,
            child: Container(
              height: 520,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: GoogleFonts.alike(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _NameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Username",
                        labelStyle: GoogleFonts.alike(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email",
                        labelStyle: GoogleFonts.alike(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Password",
                        labelStyle: GoogleFonts.alike(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Confirm Password",
                        labelStyle: GoogleFonts.alike(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_emailController.text.isEmpty ||
                            _NameController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Fill all the fields"),
                            ),
                          );
                        } else {
                          register(context);
                        }
                      },
                      child: Text(
                        "Create",
                        style: GoogleFonts.alike(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
