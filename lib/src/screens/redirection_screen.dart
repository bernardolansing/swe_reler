import 'package:flutter/material.dart';

class RedirectionScreen extends StatelessWidget {
  const RedirectionScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Text(_text),
  );

  static const _text = 'Você não está autorizado a acessar essa página. '
      'Redirecionando...';
}
