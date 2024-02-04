import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe_reler/src/data_types.dart';

class Admin {
  static CollectionReference get _giftsCollection => FirebaseFirestore.instance
      .collection('gifts');

  static Future<void> registerGift(Gift gift) =>
      _giftsCollection.doc().set(gift.toMap);

  static Future<void> editGift(Gift newGift) =>
      _giftsCollection.doc(newGift.code).update(newGift.toMap);
}
