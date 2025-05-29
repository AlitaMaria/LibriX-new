import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librix/screens/homescreen.dart';
import 'package:librix/screens/provider.dart';
import 'package:librix/stories/greenRoad.dart';
import 'package:librix/stories/nightCircus.dart';
import 'package:librix/stories/oceanAtTheEnd.dart';
import 'package:librix/stories/silentPatient.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    String? selectedItem;

    // void showItemSelectionDialog(BuildContext context) async {
    //   final List<String> allItems = [];

    //   String? picked = await showDialog<String>(
    //     context: context,
    //     builder: (context) {
    //       return SimpleDialog(
    //         title: Text('Added to favorites'),
    //         children: allItems.map((item) {
    //           return SimpleDialogOption(
    //             child: Text(item),
    //             onPressed: () {
    //               Navigator.pop(context, item);
    //             },
    //           );
    //         }).toList(),
    //       );
    //     },
    //   );

    //   if (picked != null) {
    //     setState(() {
    //       selectedItem = picked;
    //     });
    //   }
    // }

    void onSave(BuildContext context) {
      if (selectedItem != null) {
        Provider.of<UserProvider>(context, listen: false)
            .addItem(selectedItem!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$selectedItem added to list')),
        );
      }
    }

    return Scaffold(
        body: Column(children: [
      Row(
        children: [
          Text("Welcome ",
              style: GoogleFonts.alike(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Padding(padding: EdgeInsets.only(left: 4)),
          Text(
              context
                  .watch<UserProvider>()
                  .userName
                  .replaceAll("@gmail.com", " "),
              style: GoogleFonts.alike(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ))
        ],
      ),
      CarouselSlider(
        items: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("THE NIGHT CIRCUS"),
                  content: Column(
                    children: [
                      Column(
                        children: [
                          Text("Do you want to read the book ?"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => nightCircus(),
                                    ));
                              },
                              child: Text("Read Now",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add review"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Add review",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add to favorites"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                onSave(context);
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Title(
                                              color: Colors.black,
                                              child:
                                                  Text("Added to favorites")),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homrscreen(),
                                                    ));
                                              },
                                              child: const Text("okay"),
                                            ),
                                          ],
                                        ));
                                context
                                    .read<UserProvider>()
                                    .addItem("THE NIGHT CIRCUS");
                              },
                              child: Text("Add",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("okay"),
                    ),
                  ],
                ),
              );
            },
            child: Material(
              elevation: 20,
              child: Container(
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 7.0,
                //     )
                //   ],
                // ),

                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://rukminim3.flixcart.com/image/720/864/kiow6fk0-0/book/p/z/e/the-night-circus-original-imafyf8j6jftbg4f.jpeg?q=60&crop=false"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.topLeft),
                            Text(
                              "published in 2011",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "THE NIGHT CIRCUS",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "By Erin Morgenstern",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("THE SILENT PATIENT"),
                  content: Column(
                    children: [
                      Column(
                        children: [
                          Text("Do you want to read the book ?"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Silentpatient(),
                                    ));
                              },
                              child: Text("Read Now",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text(
                            "Add Review",
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Add review",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add to favorites"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                onSave(context);
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Title(
                                              color: Colors.black,
                                              child:
                                                  Text("Added to favorites")),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homrscreen(),
                                                    ));
                                              },
                                              child: const Text("okay"),
                                            ),
                                          ],
                                        ));
                                context
                                    .read<UserProvider>()
                                    .addItem("THE SILENT PATIENT");
                              },
                              child: Text("Add",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("okay"),
                    ),
                  ],
                ),
              );
            },
            child: Material(
              elevation: 20,
              child: Container(
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 7.0,
                //     )
                //   ],
                // ),

                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/I/91lslnZ-btL._AC_UF1000,1000_QL80_.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.topLeft),
                            Text(
                              "published in 2019",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "THE SILENT PATIENT",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "By Alex Michaelides",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("THE GREEN ROAD"),
                  content: Column(
                    children: [
                      Column(
                        children: [
                          Text("Do you want to read the book ?"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Greenroad(),
                                    ));
                              },
                              child: Text("Read Now",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add Review"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Add review",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add to favorites"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                onSave(context);
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Title(
                                              color: Colors.black,
                                              child:
                                                  Text("Added to favorites")),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homrscreen(),
                                                    ));
                                              },
                                              child: const Text("okay"),
                                            ),
                                          ],
                                        ));
                                context
                                    .read<UserProvider>()
                                    .addItem("THE GREEN ROAD");
                              },
                              child: Text("Add",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("okay"),
                    ),
                  ],
                ),
              );
            },
            child: Material(
              elevation: 20,
              child: Container(
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 7.0,
                //     )
                //   ],
                // ),

                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/I/61fVHOfHJtL._AC_UF1000,1000_QL80_.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.topLeft),
                            Text(
                              "published in 2019",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "THE GREEN ROAD",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "By Anne Enright",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("THE OCEAN AT THE END OF THE LANE"),
                  content: Column(
                    children: [
                      Column(
                        children: [
                          Text("Do you want to read the book ?"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => oceanAtTheEnd(),
                                    ));
                              },
                              child: Text("Read Now",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add Review"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Add review",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Text("Add to favorites"),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                onSave(context);
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Title(
                                              color: Colors.black,
                                              child:
                                                  Text("Added to favorites")),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homrscreen(),
                                                    ));
                                              },
                                              child: const Text("okay"),
                                            ),
                                          ],
                                        ));
                                context.read<UserProvider>().addItem(
                                    "THE OCEAN AT THE END OF THE LANE ");
                              },
                              child: Text("Add",
                                  style: GoogleFonts.alike(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("okay"),
                    ),
                  ],
                ),
              );
            },
            child: Material(
              elevation: 20,
              child: Container(
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 7.0,
                //     )
                //   ],
                // ),

                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/I/91q+Aa0wIvL._AC_UF1000,1000_QL80_DpWeblab_.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.topLeft),
                            Text(
                              "published in 2013",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "THE OCEAN AT THE END OF THE LANE",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "By Neil Gaiman",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Add other items similarly
        ],
        options: CarouselOptions(
          height: height / 1.5,
          autoPlay: true,
          aspectRatio: 9 / 10,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 80),
          viewportFraction: 0.6,
        ),
      ),
    ]));
  }
}
