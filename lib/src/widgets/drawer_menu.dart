import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    width: 420,
    shape: const BeveledRectangleBorder(),
    child: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Colors.white.withAlpha(76)
                  )
                ),
                icon: const Icon(Icons.close, size: 36),
              ),
            ),
            const SizedBox(height: 64),

            TextButton(
              onPressed: () {},
              child: const Text('home'),
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () {},
              child: const Text('painel de usuário'),
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () {},
              child: const Text('loja'),
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () {},
              child: const Text('doe um livro'),
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () {},
              child: const Text('configurações'),
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () {},
              child: const Text('logout'),
            ),
          ],
        ),
      )
    ),
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
