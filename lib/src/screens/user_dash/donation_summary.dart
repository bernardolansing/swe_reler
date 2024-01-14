import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/user_dash/pending_donations_dialog.dart';

class DonationSummary extends StatelessWidget {
  const DonationSummary({super.key});

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 520),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'última doação',
                      style: Theme.of(context).textTheme.headlineSmall
                  ),
                  const SizedBox(height: 16),

                  const Text('pacote DJ6D89D', style: _packageNameTextStyle),
                  const SizedBox(height: 8),

                  Text(
                    'status: aguardando recebimento do pacote',
                    style: Theme.of(context).textTheme.bodyLarge,
                    softWrap: true,
                  ),
                  const SizedBox(height: 8),

                  const Text(
                      'última atualização em 15/12/2023',
                      softWrap: true
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            const Image(
                image: AssetImage('assets/user-dash/books-over-box.png')
            ),
          ],
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => const PendingDonationsDialog()
          ),
          child: const Text('veja todas as doações pendentes'),
        ),
        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: () {},
          child: const Text('doe seus livros'),
        )
      ],
    ),
  );

  static const _packageNameTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Color(0xFF9B693B),
      fontWeight: FontWeight.w400,
      height: 0.75
  );
}
