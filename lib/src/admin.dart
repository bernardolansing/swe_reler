import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe_reler/src/data_types.dart';
import 'package:swe_reler/src/user.dart';
import 'package:universal_html/html.dart';

bool _moduleIsAlive = false;

class Admin {
  static List<Gift>? _gifts;

  static List<Gift> get gifts {
    _ensureModuleIsAlive();
    assert (AppUser.isAdmin);
    return _gifts!;
  }

  static CollectionReference get _giftsCollection => FirebaseFirestore.instance
      .collection('gifts');

  static void _ensureModuleIsAlive() {
    if (! _moduleIsAlive) {
      _restoreFromSessionStorage();
      _moduleIsAlive = true;
    }
  }

  /// Saves Admin module to session storage so it may be recovered in case of
  /// page refresh or even Flutter hot reload.
  static void _saveToSessionStorage() {
    final ss = window.sessionStorage;
    ss['adminIsCached'] = 'true';
    ss['gifts'] = json.encode(_gifts!.map((g) => g.toSessionStorage).toList());
  }

  /// Reads the session storage searching for a saved Admin's module state and,
  /// if found, recovers it.
  static void _restoreFromSessionStorage() {
    final ss = window.sessionStorage;
    if (ss['adminIsCached'] != 'true') { return; }
    _gifts = (json.decode(ss['gifts']!) as List)
        .map((g) => Gift.fromSessionStorage(g as Map))
        .toList();
  }

  static Future<void> initialize() async {
    await _loadGifts();
    _moduleIsAlive = true;
    _saveToSessionStorage();
  }

  static Future<void> _loadGifts() async {
    final snapshot = await _giftsCollection.get();
    _gifts = snapshot.docs
        .map((doc) => Gift.fromEntry(doc.id, doc.data() as Map))
        .toList();
  }

  static void registerGift(Gift gift) {
    _gifts!.add(gift);
    _giftsCollection.doc().set(gift.toMap);
  }

  static Future<void> editGift(Gift newGift) =>
      _giftsCollection.doc(newGift.code).update(newGift.toMap);

  static void deleteGift(Gift gift) {
    _giftsCollection.doc(gift.code).delete();
    _gifts!.remove(gift);
  }
}
