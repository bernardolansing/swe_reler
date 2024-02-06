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

  Donation.fromSessionStorageEntry(Map entry):
        code = entry['code'],
        status = DonationStatus.values.byName(entry['status']),
        lastUpdate = DateTime
            .fromMillisecondsSinceEpoch(entry['lastUpdated'] as int),
        books = (entry['books'] as List).map((b) => b.toString()).toList();

  Map<String, dynamic> get toMap => {'code': code, 'status': status.name,
    'lastUpdated': lastUpdate.millisecondsSinceEpoch, 'books': books};
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
        id = _generateRandomId(6),
        date = DateTime.now(),
        totalPrice = books.fold(0, (acc, elem) => acc + elem.unitPrice);

  Purchase.fromEntry(Map entry) :
        id = entry['id'],
        books = (entry['books'] as List)
            .map((entry) => PurchasedBook.fromEntry(entry as Map))
            .toList(growable: false),
        date = (entry['date'] as Timestamp).toDate(),
        totalPrice = entry['totalPrice'];

  Purchase.fromSessionStorage(Map entry) :
      id = entry['id'],
      books = (entry['books'] as List)
          .map((b) => PurchasedBook.fromEntry(b as Map))
          .toList(),
      date = DateTime.fromMillisecondsSinceEpoch(entry['date'] as int),
      totalPrice = entry['totalPrice'];

  Map<String, dynamic> get toSessionStorage => {'id': id,
    'totalPrice': totalPrice, 'date': date.millisecondsSinceEpoch,
    'books': books.map((b) => b.toMap).toList()};
}

class PurchasedBook {
  final String title;
  final double unitPrice;

  const PurchasedBook({
    required this.title,
    required this.unitPrice,
  });

  PurchasedBook.fromEntry(Map entry) :
        title = entry['title'],
        unitPrice = entry['unitPrice'];

  Map<String, dynamic> get toMap => {'title': title, 'unitPrice': unitPrice};
}

class Gift {
  final String code;
  String title;
  String brand;
  String category;
  double price;
  int amount;

  Gift({
    required this.title,
    required this.brand,
    required this.category,
    required this.price,
    required this.amount,
  }) :
        code = _generateRandomId(20);

  Gift.fromEntry(this.code, Map entry) :
        title = entry['title'],
        brand = entry['brand'],
        category = entry['category'],
        price = entry['price'],
        amount = entry['amount'];

  Gift.fromSessionStorage(Map entry) :
      code = entry['code'],
      title = entry['title'],
      brand = entry['brand'],
      category = entry['category'],
      price = entry['price'] as double,
      amount = entry['amount'] as int;

  Map<String, dynamic> get toMap => {'title': title, 'brand': brand,
    'category': category, 'price': price, 'amount': amount};

  Map<String, dynamic> get toSessionStorage => {'title': title, 'brand': brand,
    'category': category, 'price': price, 'amount': amount, 'code': code};
}

String _generateRandomId(int length) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  final random = Random();
  final charCodes = Iterable.generate(
      length, (index) => chars.codeUnitAt(random.nextInt(chars.length))
  );
  return String.fromCharCodes(charCodes);
}
