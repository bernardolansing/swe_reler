import 'package:flutter/material.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/drawer_menu_button.dart';

class NavBar extends StatelessWidget {
  final List<GlobalKey> sectionKeys;

  const NavBar({super.key, required this.sectionKeys});

  void _scrollToSection(int sectionIndex) => Scrollable.ensureVisible(
      sectionKeys[sectionIndex].currentContext!,
      duration: const Duration(seconds: 1, milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn
  );

  Future<void> _openLoginScreen(BuildContext context) => Navigator.of(context)
      .pushNamed('/login');

  Future<void> _openSignUpScreen(BuildContext context) => Navigator.of(context)
      .pushNamed('/signup');

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
                    if (User.signedIn)
                      const DrawerMenuButton()
                    else
                      _buildLoginAndRegisterButtons(context)
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
            onPressed: () => _scrollToSection(0),
            child: const Text('como funciona?', style: _buttonsTextStyle)
        ),
        _spacing,

        TextButton(
            onPressed: () => _scrollToSection(1),
            child: const Text('o que tem dentro?', style: _buttonsTextStyle)
        ),
        _spacing,

        TextButton(
          onPressed: () => _scrollToSection(2),
          child: const Text('planos', style: _buttonsTextStyle),
        ),
        _spacing,

        TextButton(
          onPressed: () {},
          child: const Text('faq', style: _buttonsTextStyle),
        ),
        _spacing,

        TextButton(
          onPressed: () => _scrollToSection(3),
          child: const Text('contato', style: _buttonsTextStyle),
        ),
      ]
  );

  Widget _buildLoginAndRegisterButtons(BuildContext context) => Row(
    children: [
      TextButton(
        onPressed: () => _openLoginScreen(context),
        child: const Text('login', style: _buttonsTextStyle),
      ),
      _spacing,

      ElevatedButton(
        onPressed: () => _openSignUpScreen(context),
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
