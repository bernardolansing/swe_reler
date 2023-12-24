import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithLinkPortion extends StatelessWidget {
  final String nonLinkPortion;
  final String linkPortion;
  final void Function() onTap;

  const TextWithLinkPortion({
    super.key,
    required this.nonLinkPortion,
    required this.linkPortion,
    required this.onTap
  });

  TapGestureRecognizer get _recognizer => TapGestureRecognizer()
      ..onTap = onTap;

  @override
  Widget build(BuildContext context) => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$nonLinkPortion ', // Adding trailing space here.
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
          )
        ),

        TextSpan(
          text: linkPortion,
          recognizer: _recognizer,
          style: const TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600
          )
        )
      ]
    ),
  );
}
