import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 48, horizontal: 64),
    child: Column(
      children: [
        HighlightedText('planos'),
        SizedBox(height: 24),

        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PlanOffer(
                  planName: 'kit básico',
                  description: 'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit. Proin vestibulum lectus in nulla '
                      'dignissim, a imperdiet sem rhoncus.',
                  benefits: [
                    '2 livros cuidadosamente selecionados',
                    '2 brindes',
                  ],
                  price: 22
              ),

              SizedBox(width: 24),

              _PlanOffer(
                  planName: 'kit premium',
                  description: 'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit. Proin vestibulum lectus in nulla '
                      'dignissim, a imperdiet sem rhoncus.',
                  benefits: [
                    '3 livros cuidadosamente selecionados',
                    '4 brindes',
                    'acesso ao grupo exclusivo do Discord',
                    'cupons exclusivos com lojas parceiras',
                  ],
                  price: 30
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _PlanOffer extends StatelessWidget {
  final String planName;
  final String description;
  final List<String> benefits;
  final double price;

  const _PlanOffer({
    required this.planName,
    required this.description,
    required this.benefits,
    required this.price,
  });

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 600),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(planName, style: _titleStyle),

            Text(description, style: _bodyTextStyle, softWrap: true),
            const SizedBox(height: 16),

            ...benefits.map((benefit) => Text(
                '\u2022 $benefit', // \u2022 is the bullet market for unordered
                // list.
                softWrap: true,
                style: _bodyTextStyle
            )),

            Expanded(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 32)
              )
            ),

            // const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  'R\$ ${price.toStringAsFixed(2)}/mês',
                  style: _priceTextStyle
              ),
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('assinar'),
              ),
            )
          ],
        ),
      ),
    ),
  );

  static const _titleStyle = TextStyle(
    fontSize: 72,
    fontFamily: 'Teko',
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const _bodyTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const _priceTextStyle = TextStyle(
    fontSize: 32,
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
}
