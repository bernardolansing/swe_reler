import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data_types.dart';

class AppUser {
  static String? _id;
  static String? _email;
  static String? _displayName;
  static int? _lispectors;
  static int? _points;
  static List<Donation>? _donations;

  static bool get signedIn => _id != null;

  static String get email {
    assert (signedIn);
    return _email!;
  }

  static String get displayName {
    assert (signedIn);
    return _displayName!;
  }
  
  static int get lispectors {
    assert(signedIn);
    return _lispectors!;
  }
  
  static int get points {
    assert (signedIn);
    return _points!;
  }

  static List<Donation> get donations {
    assert(signedIn);
    return _donations!;
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

      // Fetch further user data from database:
      final snapshot = await _userDoc.get();
      final data = snapshot.data() as Map;
      _lispectors = data['lispectors'];
      _points = data['points'];
      _donations = (data['donations'] as List)
          .map((entry) => Donation(entry as Map))
          .toList(growable: false);
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
      };
      _userDoc.set(entry);
      _lispectors = 0;
      _points = 0;
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
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    log('Successful logout.');
  }

  /// Takes the result of a login/signup operation and updates the [AppUser]
  /// class fields accordingly.
  static void _updateUserId(User user) {
    _id = user.uid;
    _email = user.email;
    _displayName = user.displayName;
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
