import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String text;

  const InfoDialog({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: [
      TextButton(
        onPressed: Navigator.of(context).pop,
        child: const Text('Ok', style: TextStyle(color: Colors.black))
      )
    ],
  );
}
