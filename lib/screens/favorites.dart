import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:librix/screens/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final itemList = context.watch<UserProvider>().items;
    return Scaffold(
      body: itemList.isEmpty
          ? Center(child: Text("No items added yet."))
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(itemList[index],
                    style: GoogleFonts.alike(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))),
              ),
            ),
    );
  }
}
