import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:librix/screens/loginpage.dart';
import 'package:librix/screens/provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _base64Image;
  String? _username;
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  /// 🔹 Retrieve Username from SharedPreferences
  Future<void> retrieveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('Username'); // Retrieve saved username

    if (username != null) {
      setState(() {
        _username = username;
      });
      _loadProfileImage(username); // Load image after username retrieval
    }
  }

  /// 🔹 Load Profile Image from Firebase
  Future<void> _loadProfileImage(String username) async {
    DatabaseReference userRef = ref.child(username);

    userRef.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null && data.containsKey('profilePictureBase64')) {
        setState(() {
          _base64Image = data['profilePictureBase64'];
        });
      }
    });
  }

  /// 🔹 Logout Function (Clears SharedPreferences & Navigates to Login)
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Loginpage()),
      (route) => false, // Remove all previous routes
    );
  }

  /// 🔹 Save Image as Base64 in Firebase
  Future<void> saveImageBase64ToDatabase(String base64Image) async {
    if (_username == null) {
      print("Username is null. Cannot save image.");
      return;
    }
    DatabaseReference userRef = ref.child(_username!);
    await userRef.update({'profilePictureBase64': base64Image});
  }

  /// 🔹 Select Image Using Image Picker & Convert to Base64
  Future<void> selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);
    Uint8List bytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(bytes);

    setState(() {
      _base64Image = base64Image;
    });

    await saveImageBase64ToDatabase(base64Image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Profile Header with Image Picker
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: selectAndUploadImage, // Open image picker on tap
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: _base64Image != null
                        ? MemoryImage(base64Decode(_base64Image!))
                        : null,
                    child: _base64Image == null
                        ? Icon(Icons.person, size: 30, color: Colors.black)
                        : null,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.watch<UserProvider>().userName,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      context.watch<UserProvider>().mail,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          /// 🔹 List of Settings
          Expanded(
            child: ListView(
              children: [
                _buildListTile('Account Setting', Icons.settings),
                _buildListTile('Document Upload', Icons.upload_file),
                _buildListTile('Notification Setting', Icons.notifications),
                _buildListTile('Privacy & Policy', Icons.privacy_tip),
                _buildListTile('Help Center', Icons.help),
                _buildListTile('About Us', Icons.info),
                _buildListTile('Delete Account', Icons.delete, Colors.black),
              ],
            ),
          ),

          /// 🔹 Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  await logout(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 ListTile Builder for Settings
  ListTile _buildListTile(String title, IconData icon, [Color? color]) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
