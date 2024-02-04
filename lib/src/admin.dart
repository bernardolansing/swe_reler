import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe_reler/src/data_types.dart';
import 'package:swe_reler/src/user.dart';

class Admin {
  static List<Gift>? _gifts;

  static List<Gift> get gifts {
    assert (AppUser.isAdmin);
    return _gifts!;
  }

  static CollectionReference get _giftsCollection => FirebaseFirestore.instance
      .collection('gifts');

  static Future<void> initialize() => _loadGifts();

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
