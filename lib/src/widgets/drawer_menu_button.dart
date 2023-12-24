import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({super.key});

  @override
  Widget build(BuildContext context) => DrawerButton(
    style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0x4DFFFFFF)),
        iconSize: MaterialStatePropertyAll(36)
    ),
    onPressed: () {}, // TODO: implement drawer menu.
  );
}
