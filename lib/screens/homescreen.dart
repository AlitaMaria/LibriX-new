import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/carousel.dart';
import 'package:librix/screens/Profile.dart';

import 'package:librix/screens/favorites.dart';

import 'package:librix/screens/loginpage.dart';

class Homrscreen extends StatefulWidget {
  const Homrscreen({super.key});

  @override
  State<Homrscreen> createState() => _ClassesState();
}

class _ClassesState extends State<Homrscreen> {
  var size, height, width;
  int _currentIndex = 0;
  String appbarstr = "LibriX";
  List namestr = ["LibriX", "Favorites", "Account"];

  // List of screens for BottomNavigationBar
  final List<Widget> _screens = [
    Carousel(),
    Favorites(), // Navigate to Class screen when Home is selected
    Profile(), // Navigate to Profile screen
    // Do not add Homrscreen() here to avoid redundancy
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
          title: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Text(namestr[_currentIndex],
                  style: GoogleFonts.greatVibes(
                    textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
