import 'package:flutter/material.dart';

class YourReports extends StatelessWidget {
  const YourReports({super.key});

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 330),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            'seus relatórios',
            style: Theme.of(context).textTheme.headlineSmall
        ),
        _spacing,

        ElevatedButton(
            onPressed: () {},
            style: _buttonStyle,
            child: const Text('relatório de BOKS')
        ),
        _spacing,

        ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/purchase-report'),
          style: _buttonStyle,
          child: const Text('relatório de transações'),
        ),
        _spacing,

        ElevatedButton(
          onPressed: () {},
          style: _buttonStyle,
          child: const Text('relatório de doações'),
        )
      ],
    ),
  );

  static const _spacing = SizedBox(height: 24);

  static const _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color(0xFF9B693B)),
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 29, horizontal: 16)
      ),
      textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )
      ),
    elevation: MaterialStatePropertyAll(0),
  );
}
