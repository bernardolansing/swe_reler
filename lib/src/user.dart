import 'package:firebase_auth/firebase_auth.dart';

class User {
  static String? _id;
  static String? _email;

  bool get signedIn => _id != null;

  String get email {
    assert (_email != null); // Ensure that user is signed in.
    return _email!;
  }
  
  static Future<void> loginWithEmail(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      _updateUser(result);
    }

    on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          throw InvalidEmail();
        case 'user-not-found':
          throw UserNotFound();
        case 'wrong-password':
          throw WrongPassword();
        case 'user-disabled':
          throw DeletedAccount();
      }
    }
  }

  static Future<void> signUpWithEmail(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _updateUser(result);
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
  }
}

/// Related to a misformatted email address.
class InvalidEmail implements Exception {}

/// This email address already belongs to another account.
class UsedEmail implements Exception {}

/// The provided email does not belong to any user account.
class UserNotFound implements Exception {}

/// User was identified, but the wrong password has been supplied.
class WrongPassword implements Exception {}

/// The supplied credentials belong to a user account that has been deleted.
class DeletedAccount implements Exception {}
