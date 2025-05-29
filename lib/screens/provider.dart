import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String userName = "";
  String Password = "";
  String mail = "";
  List<String> _items = [];

  List<String> get items => _items;

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> _favoriteBooks = [];
  bool _isLoading = false;
  StreamSubscription? _authSubscription;
  StreamSubscription? _favoritesSubscription;

  UserProvider({
    this.userName = "",
    this.Password = "",
    this.mail = "",
  }) {
    loadItems();
  }

  Future<void> loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _items = prefs.getStringList('myList') ?? [];
    notifyListeners();
  }

  Future<void> addItem(String item) async {
    _items.add(item);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('myList', _items);
    notifyListeners();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _favoritesSubscription?.cancel();
    super.dispose();
  }

  // void _setupAuthListener() {
  //   _authSubscription = _auth.authStateChanges().listen((User? user) {
  //     if (user != null) {
  //       _loadFavorites();
  //     } else {
  //       _favoriteBooks.clear();
  //       notifyListeners();
  //     }
  //   });
  // }

  // List<String> _items = [];
  // List<String> get items => _items;
  // List<String> get favoriteBooks => _favoriteBooks;
  // bool get isLoading => _isLoading;

  // void _loadFavorites() {
  //   _favoritesSubscription?.cancel();

  //   if (_auth.currentUser != null) {
  //     _favoritesSubscription = _database
  //         .child('users/${_auth.currentUser!.uid}/favorites')
  //         .onValue
  //         .listen(
  //       (event) {
  //         if (event.snapshot.value != null) {
  //           final data = event.snapshot.value as Map<dynamic, dynamic>;
  //           _favoriteBooks = data.values.map((e) => e.toString()).toList();
  //           notifyListeners();
  //         }
  //       },
  //       onError: (error) {
  //         print('Error loading favorites: $error');
  //         ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
  //           SnackBar(
  //             content: Text('Error loading favorites: $error'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       },
  //     );
  //   }
  // }

  // void addItem(String newItem) {
  //   _items.add(newItem);
  //   notifyListeners();
  // }

  // void updateClasses(List<String> newClasses) {
  //   for (String item in newClasses) {
  //     if (!_items.contains(item)) {
  //       _items.add(item);
  //     }
  //   }
  //   notifyListeners();
  // }

  void changeUsername({
    required String newUsername,
    required String newPassword,
    required String newmail,
  }) async {
    userName = newUsername;
    mail = newmail;
    Password = newPassword;
    notifyListeners();
  }

  // Future<void> addFavoriteBook(String book) async {
  //   if (_auth.currentUser == null) {
  //     throw Exception('User must be logged in to add favorites');
  //   }

  //   if (!_favoriteBooks.contains(book)) {
  //     _isLoading = true;
  //     notifyListeners();

  //     try {
  //       // First check if the book already exists
  //       final snapshot = await _database
  //           .child('users/${_auth.currentUser!.uid}/favorites')
  //           .orderByValue()
  //           .equalTo(book)
  //           .get();

  //       if (!snapshot.exists) {
  //         await _database
  //             .child('users/${_auth.currentUser!.uid}/favorites')
  //             .push()
  //             .set(book);
  //         _favoriteBooks.add(book);
  //         notifyListeners();
  //       }
  //     } catch (e) {
  //       print('Error adding favorite: $e');
  //       throw Exception('Failed to add book to favorites: $e');
  //     } finally {
  //       _isLoading = false;
  //       notifyListeners();
  //     }
  //   }
  // }

  // Future<void> removeFavoriteBook(String book) async {
  //   if (_auth.currentUser == null) {
  //     throw Exception('User must be logged in to remove favorites');
  //   }

  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     final snapshot = await _database
  //         .child('users/${_auth.currentUser!.uid}/favorites')
  //         .orderByValue()
  //         .equalTo(book)
  //         .get();

  //     if (snapshot.exists) {
  //       final key = snapshot.children.first.key;
  //       await _database
  //           .child('users/${_auth.currentUser!.uid}/favorites/$key')
  //           .remove();
  //       _favoriteBooks.remove(book);
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print('Error removing favorite: $e');
  //     throw Exception('Failed to remove book from favorites: $e');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
