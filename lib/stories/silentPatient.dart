import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/carousel.dart';

class Silentpatient extends StatelessWidget {
  const Silentpatient({super.key});

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
          child: Text("THE SILENT PATIENT",
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
              "The Silent Patient by Alex Michaelides is a psychological thriller centered on Alicia Berenson, a famous painter who seemingly has a perfect life until she’s found standing next to her murdered husband, Gabriel, and never speaks again. Admitted to a secure psychiatric facility called The Grove, Alicia becomes a national mystery. Theo Faber, a criminal psychotherapist, is obsessed with her case and takes a job at The Grove to unravel why she killed her husband. As Theo digs into Alicia’s life, he discovers layers of trauma and secrets, including a disturbing truth: Theo himself had broken into Alicia's house, masked, to confront Gabriel for having an affair with Theo’s wife. He forced Gabriel to choose between Alicia and himself—Gabriel chose himself, breaking Alicia emotionally. Alicia later shot Gabriel and chose silence, expressing the truth only through her paintings and a hidden diary. When Theo reads the diary and tries to silence Alicia permanently by drugging her, she ultimately outs him through her written words. The novel explores themes of trauma, obsession, betrayal, and the haunting power of silence",
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
