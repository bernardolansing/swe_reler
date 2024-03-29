import 'dart:convert';
import 'dart:developer';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:universal_html/html.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swe_reler/src/admin.dart';
import 'data_types.dart';

bool _moduleAlive = false;

class AppUser {
  static String? _id;
  static String? _email;
  static String? _displayName;
  static int? _lispectors;
  static int? _points;
  static List<Donation>? _donations;
  static List<Purchase>? _purchases;
  static List<Book>? _cartItems = [];
  static bool? _isAdmin;

  static bool get signedIn {
    _ensureLoaded();
    return _id != null;
  }

  static String get email {
    assert (signedIn);
    _ensureLoaded();
    return _email!;
  }

  static String get displayName {
    assert (signedIn);
    _ensureLoaded();
    return _displayName!;
  }

  static int get lispectors {
    assert(signedIn);
    _ensureLoaded();
    return _lispectors!;
  }

  static int get points {
    assert (signedIn);
    _ensureLoaded();
    return _points!;
  }

  static List<Donation> get donations {
    assert (signedIn);
    _ensureLoaded();
    return _donations!;
  }

  static List<Purchase> get purchases {
    assert (signedIn);
    _ensureLoaded();
    return _purchases!;
  }

  static List<Book> get cartItems {
    assert (signedIn);
    _ensureLoaded();
    return _cartItems!;
  }

  static bool get isAdmin {
    assert (signedIn);
    _ensureLoaded();
    return _isAdmin!;
  }

  static DocumentReference get _userDoc => FirebaseFirestore.instance
      .collection('users').doc(_id);

  static Future<void> initialize() async {
    // Listen to auth state changes.
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) { _updateUserId(user); }
    });

    // Increase id token persistence.
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  static void _ensureLoaded() {
    if (! _moduleAlive) {
      _restoreFromSessionStorage();
      _moduleAlive = true;
    }
  }

  /// Saves AppUser's state to the session storage, so it may be restored in
  /// case of a page refresh.
  static void _saveToSessionStorage() {
    if (signedIn) {
      log('Saving user information to the session storage');
      final ss = window.sessionStorage;
      ss['userIsCached'] = 'true';
      if (_isAdmin != true) {
        ss['lispectors'] = _lispectors.toString();
        ss['points'] = _points.toString();
        ss['donations'] = json.encode(_donations!.map((d) => d.toMap).toList());
        ss['purchases'] = json
            .encode(_purchases!.map((p) => p.toSessionStorage).toList());
        ss['cartItems'] = json
            .encode(_cartItems!.map((i) => i.toSessionStorage).toList());
      }
      ss['isAdmin'] = _isAdmin.toString();
    }

  }

  /// Restores AppUser's state from session storage.
  static void _restoreFromSessionStorage() {
    final ss = window.sessionStorage;
    if (ss['userIsCached'] != 'true') { return; }
    log('Restoring user information from the session storage');
    _isAdmin = ss['isAdmin'] == 'true';
    if (! _isAdmin!) {
      _lispectors = int.parse(ss['lispectors']!);
      _points = int.parse(ss['points']!);
      _donations = (json.decode(ss['donations']!) as List)
          .map((entry) => Donation.fromSessionStorageEntry(entry))
          .toList();
      _purchases = (json.decode(ss['purchases']!) as List)
          .map((entry) => Purchase.fromSessionStorage(entry))
          .toList();
      _cartItems = (json.decode(ss['cartItems']!) as List)
          .map((entry) => Book.fromSessionStorage(entry))
          .toList();
    }
  }

  /// Authenticate with email and password. May throw [InvalidEmail],
  /// [WrongCredentials], and [DeletedAccount].
  static Future<void> loginWithEmail(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = result.user!;
      _id = user.uid;
      _email = user.email;
      _displayName = user.displayName;
      log('Successful login with email: $email');

      if (email == 'admin@reler.com') {
        _isAdmin = true;
        await Admin.initialize();
      }

      else {
        // Fetch further user data from database:
        final snapshot = await _userDoc.get();
        final data = snapshot.data() as Map;
        _lispectors = data['lispectors'];
        _points = data['points'];
        _donations = (data['donations'] as List)
            .map((entry) => Donation(entry as Map))
            .toList(growable: false);
        _purchases = (data['purchases'] as List)
            .map((entry) => Purchase.fromEntry(entry))
            .toList();
        _isAdmin = false;
      }

      _saveToSessionStorage();
    }

    on FirebaseAuthException catch (error) {
      log('Failed login attempt with email: $email');
      switch (error.code) {
        case 'invalid-email':
          throw InvalidEmail();
        case 'invalid-credential':
          throw WrongCredentials();
        case 'user-disabled':
          throw DeletedAccount();
      }
    }

    FirebaseAuth.instance.setPersistence(Persistence.LOCAL); // Make the id
    // token last longer.
  }

  /// Creates an account with email and password. May throw [UsedEmail] and
  /// [InvalidEmail].
  static Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _id = result.user!.uid;
      _email = result.user!.email;
      _displayName = name;
      result.user!.updateDisplayName(name); // As the user's display name can't
      // be set straight at its creation time, we have to order the change in
      // this another request.

      // Upload user entry to the database:
      final entry = {
        'lispectors': 0,
        'points': 0,
        'donations': [],
        'purchases': [],
      };
      _userDoc.set(entry);
      _lispectors = 0;
      _points = 0;
      _donations = [];
      _purchases = [];
      _cartItems = [];
      _isAdmin = false;

      _saveToSessionStorage();
    }

    on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          throw UsedEmail();
        case 'invalid-email':
          throw InvalidEmail();
      }
    }
  }

  /// Logs the user out and redirects them to the landing page, removing all
  /// screens from the Navigator history.
  static void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    _id = null;
    _email = null;
    _displayName = null;
    _lispectors = null;
    _points = null;
    _donations = null;
    _purchases = null;
    _cartItems = [];
    _isAdmin = null;
    window.sessionStorage.clear();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    log('Successful logout.');
  }

  /// Adds the given book to the user's shopping cart. Returns true if the book
  /// is successfully added, and false if it was already added (therefore not
  /// added again).
  static bool addToCart(Book book) {
    if (cartItems.contains(book)) { return false; }
    cartItems.add(book);
    _saveToSessionStorage();
    return true;
  }

  /// Removes the given book from the user's shopping cart.
  static void removeFromCart(Book book) {
    cartItems.remove(book);
    _saveToSessionStorage();
  }

  /// Takes the result of a login/signup operation and updates the [AppUser]
  /// class fields accordingly.
  static void _updateUserId(User user) {
    _id = user.uid;
    _email = user.email;
    _displayName = user.displayName;
  }

  /// Concludes the purchase of the books that are in the shopping cart.
  static void purchaseBooks() {
    if (cartItems.isEmpty) { return; }
    final purchasedBooks = cartItems.map((cartItem) => PurchasedBook(
        title: cartItem.title,
        unitPrice: cartItem.price
    )).toList();
    final newPurchase = Purchase(purchasedBooks);
    purchases.add(newPurchase);
    cartItems.clear();
    _saveToSessionStorage();
    _userDoc.update(
        {'purchases': FieldValue.arrayUnion([newPurchase.toDatabase])}
    );
  }
}

/// Related to a misformatted email address.
class InvalidEmail implements Exception {}

/// This email address already belongs to another account.
class UsedEmail implements Exception {}

/// The supplied authentication credentials didn't match for any account.
class WrongCredentials implements Exception {}

/// The supplied credentials belong to a user account that has been deleted.
class DeletedAccount implements Exception {}
