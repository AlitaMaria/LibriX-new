import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/carousel.dart';

class Greenroad extends StatelessWidget {
  const Greenroad({super.key});

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
          child: Text("THE GREEN ROAD",
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
              "The Green Road by Anne Enright is a poignant and lyrical novel that traces the lives of the Madigan family from County Clare, Ireland, over several decades. At the center is Rosaleen Madigan, a proud and emotionally complex matriarch whose four children—Dan, Hanna, Constance, and Emmet—grow up and scatter across the globe, each carrying their own burdens and longings. Dan becomes a gay man navigating identity in New York during the AIDS crisis, Hanna struggles with motherhood and lost potential in Dublin, Constance leads a conventional but quietly unfulfilled life near their hometown, and Emmet works in humanitarian aid across Africa, emotionally distant from everyone. The novel shifts perspectives between these characters, painting intimate portraits of their struggles and the emotional distances between them. Eventually, they all return home for one last Christmas at the family house, prompted by Rosaleen’s announcement that she intends to sell it. Their reunion forces buried tensions, regrets, and affections to surface, culminating in a symbolic walk on the green road where Rosaleen goes missing. Enright explores themes of family, memory, identity, and the quiet ache of change and disconnection, offering a richly textured meditation on what it means to belong—to a place, to people, and to the past.",
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
