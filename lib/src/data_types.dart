import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  final String code;
  final DonationStatus status;
  final DateTime lastUpdate;
  final List<String> books;

  Donation(Map entry) :
        code = entry['code'],
        status = DonationStatus.values.byName(entry['status']),
        lastUpdate = (entry['lastUpdate'] as Timestamp).toDate(),
        books = (entry['books'] as List)
            .map((book) => book as String)
            .toList(growable: false);
}

enum DonationStatus {
  awaitingReceival,
  underInspection,
  finished,
}

class Purchase {
  final String id;
  final List<PurchasedBook> books;
  final DateTime date;
  final double totalPrice;

  Purchase(this.books) :
        id = _generateId,
        date = DateTime.now(),
        totalPrice = books
            .fold(0, (acc, elem) => acc + elem.unitPrice * elem.amount);

  Purchase.fromEntry(Map entry) :
        id = entry['id'],
        books = (entry['books'] as List)
            .map((entry) => PurchasedBook.fromEntry(entry))
            .toList(growable: false),
        date = (entry['date'] as Timestamp).toDate(),
        totalPrice = entry['totalPrice'];

  static String get _generateId {
    const idLength = 6;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final random = Random();
    final charCodes = Iterable.generate(
        idLength, (index) => chars.codeUnitAt(random.nextInt(chars.length))
    );
    return String.fromCharCodes(charCodes);
  }
}

class PurchasedBook {
  final String title;
  final int amount;
  final double unitPrice;

  const PurchasedBook({
    required this.title,
    required this.amount,
    required this.unitPrice,
  });

  PurchasedBook.fromEntry(Map entry) :
        title = entry['title'],
        amount = entry['amount'],
        unitPrice = entry['unitPrice'];
}
