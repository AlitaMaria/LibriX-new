import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/carousel.dart';

class oceanAtTheEnd extends StatelessWidget {
  const oceanAtTheEnd({super.key});

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
          child: Text("THE OCEAN AT THE END OF THE LANE",
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
              "The Ocean at the End of the Lane by Neil Gaiman is a haunting and poetic tale that blends childhood memory, myth, and magic into a darkly enchanting story. It follows an unnamed middle-aged man who returns to his hometown for a funeral and is drawn to the farm at the end of the lane, where he once met Lettie Hempstock, an extraordinary girl who claimed the pond behind her house was an ocean. As he sits by the water, long-forgotten memories of his childhood come flooding back—memories of a strange and terrifying series of events triggered by the suicide of a lodger in his home. That death unleashes an ancient, malevolent force that invades his world, taking the form of Ursula Monkton, a sinister woman who manipulates his family and reality itself. With the help of Lettie and her wise, otherworldly relatives, he must confront this dark power. The story explores themes of memory, innocence, sacrifice, and the fragile, magical boundary between childhood and adulthood. Told with lyrical prose and emotional depth, it reveals how the traumas and wonders of youth shape us, even if we do not fully remember them.",
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
