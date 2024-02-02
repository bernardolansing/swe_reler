import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(48),
    child: Column(
      children: [
        const HighlightedText('como funciona?'),
        const SizedBox(height: 32),

        Row(
          children: [
            const _Step(
              assetName: 'assets/landing-page/pick-a-plan.png',
              title: 'escolha um plano',
            ),

            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) => constraints.maxWidth > 340
                      ? _arrow1
                      : Container() // TODO: implement some arrow indication
                // for lower resolution screens.
              ),
            ),
            const _Step(
              assetName: 'assets/landing-page/receive-at-home.png',
              title: 'receba em casa',
            ),

            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) => constraints.maxWidth > 340
                      ? _arrow2
                      : Container()
              ),
            ),

            const _Step(
              assetName: 'assets/landing-page/sit-and-relax.png',
              title: 'sente e relaxe',
            )
          ],
        )
      ],
    )
  );

  static const _arrow1 = Image(
      image: AssetImage('assets/landing-page/arrow1.png')
  );

  static const _arrow2 = Image(
      image: AssetImage('assets/landing-page/arrow2.png')
  );
}

class _Step extends StatelessWidget {
  final String assetName;
  final String title;

  const _Step({required this.assetName, required this.title});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: 198,
        width: 198,
        child: Image(image: AssetImage(assetName)),
      ),
      Text(title, style: Theme.of(context).textTheme.headlineSmall)
    ],
  );
}
