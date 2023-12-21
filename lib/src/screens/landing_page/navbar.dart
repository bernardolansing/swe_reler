import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  // TODO: create better navbar that better suits mobile.
  @override
  Widget build(BuildContext context) => ColoredBox(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
                children: [
                  // We put the image inside a SizedBox so the content won't
                  // be pushed aside when the image loads.
                  const SizedBox(
                    width: 34,
                    height: 34,
                    child: Image(image: AssetImage('assets/logo34-white.png')),
                  ),
                  const SizedBox(width: 8),
                  const Text('RELER', style: _logoTextStyle),
                  _spacing,

                  if (constraints.maxWidth > 1100)
                    _sectionLinkButtons,

                  if (constraints.maxWidth > 370)
                    const Expanded(child: SizedBox()),

                  if (constraints.maxWidth > 370)
                    _loginAndRegisterButtons,
                ]
            ),
          )
      )
  );

  Widget get _sectionLinkButtons => Row(
      children: [
        const SizedBox(
          height: 26,
          child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.white
          ),
        ),
        _spacing,

        TextButton(
            onPressed: () {},
            child: const Text('como funciona?', style: _buttonsTextStyle)
        ),
        _spacing,

        TextButton(
            onPressed: () {},
            child: const Text('o que tem dentro?', style: _buttonsTextStyle)
        ),
        _spacing,

        TextButton(
          onPressed: () {},
          child: const Text('planos', style: _buttonsTextStyle),
        ),
        _spacing,

        TextButton(
          onPressed: () {},
          child: const Text('faq', style: _buttonsTextStyle),
        ),
        _spacing,

        TextButton(
          onPressed: () {},
          child: const Text('contato', style: _buttonsTextStyle),
        ),
      ]
  );

  Widget get _loginAndRegisterButtons => Row(
    children: [
      TextButton(
        onPressed: () {},
        child: const Text('login', style: _buttonsTextStyle),
      ),
      _spacing,

      ElevatedButton(
        onPressed: () {},
        child: const Text('cadastro', style: _buttonsTextStyle),
      )
    ],
  );

  static const _logoTextStyle = TextStyle(
      fontFamily: 'Bebas Neue',
      fontSize: 34,
      color: Colors.white
  );

  static const _buttonsTextStyle = TextStyle(fontSize: 18);

  static const _spacing = SizedBox(width: 24);
}