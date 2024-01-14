import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/app_dialog.dart';

class PendingDonationsDialog extends StatelessWidget {
  const PendingDonationsDialog({super.key});

  @override
  Widget build(BuildContext context) => AppDialog(
    content: const Column(
      children: [
        _PendingDonation(
            donationCode: 'DJ6D89D',
            books: ['O Código da Vinci', 'The Catcher in the Rye']
        ),

        Divider(),

        _PendingDonation(
            donationCode: 'DJ6D89D',
            books: ['O Código da Vinci', 'The Catcher in the Rye']
        ),
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed: Navigator.of(context).pop,
        child: const Text('Ok'),
      )
    ],
  );
}

class _PendingDonation extends StatelessWidget {
  final String donationCode;
  final List<String> books;

  const _PendingDonation({
    required this.donationCode,
    required this.books
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('pacote $donationCode', style: textTheme.labelLarge),
        const SizedBox(height: 16),

        Text(
            'status: aguardando recebimento do pacote',
            style: textTheme.bodyLarge
        ),
        const SizedBox(height: 8),

        const Text('última atualização em 15/12/2023'),
        const SizedBox(height: 16),

        ...books.map((bookTitle) => Text(
          '\u2022 $bookTitle',
          style: textTheme.bodyLarge,
        ))
      ],
    );
  }
}
