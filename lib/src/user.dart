import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  static String? _id;
  static String? _email;
  static String? _displayName;

  bool get signedIn => _id != null;

  String get email {
    assert (signedIn);
    return _email!;
  }

  String get displayName {
    assert (signedIn);
    return _displayName!;
  }
  
  /// Authenticate with email and password. May throw [InvalidEmail],
  /// [UserNotFound], [WrongPassword] and [DeletedAccount].
  static Future<void> loginWithEmail(String email, String password) async {
    log('Trying to login with email: $email');
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      _updateUser(result);
      log('Successful login with email: $email');
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

      _updateUser(result); // Won't take in account the provided display name,
      // so we have to set it manually later.
      _displayName = name;
      result.user!.updateDisplayName(name); // As the user's display name can't
      // be set straight at its creation time, we have to order the change in
      // this another request.
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

  /// Takes the result of a login/signup operation and updates the [User] class
  /// fields accordingly.
  static void _updateUser(UserCredential credential) {
    assert (credential.user != null);
    _id = credential.user!.uid;
    _email = credential.user!.email!;
    _displayName = credential.user!.displayName;
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
