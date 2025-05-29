import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/screens/loginpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => exit(0),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Image.asset(width: 300, height: 400, "assets/image3.jpeg"),
                Text("Welcome to LibriX",
                    style: GoogleFonts.greatVibes(
                        textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 30))),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                        "A library is not a room full of books — it’s a room \n        full of minds waiting to speak to yours.",
                        style: GoogleFonts.alike(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)))),
                Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                      child: Text("Let's Go",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ))
              ],
            ),
          ]),
        ));
  }
}
