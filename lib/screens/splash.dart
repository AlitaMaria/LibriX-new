import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) => Home(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/download.jfif',
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Center(
              child: Positioned(
                  child: Text("LibriX",
                      style: GoogleFonts.greatVibes(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              fontSize: 60)))),
            ),
          ])),
    );
  }
}
