import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/carousel.dart';

class nightCircus extends StatelessWidget {
  const nightCircus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Carousel(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Center(
          child: Text("THE NIGHT CIRCUS",
              style: GoogleFonts.alike(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25))),
        ),
      ),
      body: ListView(
        children: [
          Text(
              "The Night Circus by Erin Morgenstern is a magical, romantic fantasy centered around a mysterious circus known as Le Cirque des Rêves (The Circus of Dreams), which appears without warning and is only open at night. The story follows two young illusionists, Celia Bowen and Marco Alisdair, who have been bound since childhood into a magical competition by their powerful mentors. Neither knows the full extent of the rules or how the contest will end—they only know they must outshine one another through the fantastical tents and experiences they create in the circus. As the circus travels the world, it becomes a stage for their escalating magical feats, each more breathtaking than the last. Over time, Celia and Marco fall deeply in love, complicating the nature of the competition, which they eventually discover can only end when one of them dies. With the help of the eccentric circus cast and a group of devoted fans called rêveurs, they find a way to break free from the cycle of destruction. The novel weaves themes of love, fate, imagination, sacrifice, and the beauty of impermanence into a dreamlike narrative that blurs the line between reality and enchantment.",
              style: GoogleFonts.alike(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)))
        ],
      ),
    );
  }
}
