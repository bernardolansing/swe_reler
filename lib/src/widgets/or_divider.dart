import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) => const Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: 16),
        Text('OU'),
        SizedBox(width: 16),
        Expanded(child: Divider()),
      ]
  );
}
