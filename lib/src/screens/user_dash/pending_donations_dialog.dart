import 'package:flutter/material.dart';
import '../../widgets/app_dialog.dart';
import '../../data_types.dart';
import '../../user.dart';

class PendingDonationsDialog extends StatelessWidget {
  const PendingDonationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingDonations = AppUser.donations
        .where((donation) => donation.status != DonationStatus.finished)
        .toList(growable: false);

    return AppDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pendingDonations
              .map((d) => _PendingDonation(d))
              .toList(growable: false),
        )
    );
  }
}

class _PendingDonation extends StatelessWidget {
  final Donation _donation;

  const _PendingDonation(this._donation);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('pacote ${_donation.code}', style: textTheme.labelLarge),
        const SizedBox(height: 16),

        Text('status: $_statusText', style: textTheme.bodyLarge),
        const SizedBox(height: 8),

        Text('última atualização em $_formattedUpdateDate'),
        const SizedBox(height: 16),

        ..._donation.books.map((bookTitle) => Text(
          '\u2022 $bookTitle',
          style: textTheme.bodyLarge,
        ))
      ],
    );
  }

  String get _statusText {
    switch (_donation.status) {
      case DonationStatus.awaitingReceival:
        return 'aguardando recebimento do pacote';
      case DonationStatus.underInspection:
        return 'na fila de inspeção';
      case DonationStatus.finished:
        return 'concluída';
    }
  }

  String get _formattedUpdateDate {
    final date = _donation.lastUpdate;
    return '${date.day}/${date.month}/${date.year}';
  }
}
