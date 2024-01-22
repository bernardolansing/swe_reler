import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) => const Drawer(

  );
}

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({super.key});

  @override
  Widget build(BuildContext context) => DrawerButton(
    style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0x4DFFFFFF)),
        iconSize: MaterialStatePropertyAll(36)
    ),
    onPressed: Scaffold.of(context).openEndDrawer,
  );
}
