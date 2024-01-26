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
