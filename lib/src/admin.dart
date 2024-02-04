import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swe_reler/src/data_types.dart';

class Admin {
  static DocumentReference get _giftsDoc => FirebaseFirestore.instance
      .collection('stock')
      .doc('gifts');

  static Future<void> registerGift(Gift gift) =>
      _giftsDoc.update({'gifts': FieldValue.arrayUnion([gift.toMap])});
}
