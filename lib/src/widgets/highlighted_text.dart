import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;

  const HighlightedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) => IntrinsicWidth(
    child: Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 19,
              child: ColoredBox(
                  color: Theme.of(context).colorScheme.primary.withAlpha(127)
              ),
            ),
          ],
        ),

        Text(
            ' $text ',
            style: Theme.of(context).textTheme.headlineMedium!
                .copyWith(height: 0.55)
        ),
      ],
    ),
  );
}

// final a = BoxDecoration(
//
// );
