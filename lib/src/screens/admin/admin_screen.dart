import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/admin/books.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    endDrawer: const DrawerMenu(),
    body: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: DrawerMenuButton(),
            ),

            const HighlightedText('administração'),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Livros'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Brindes'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('BOKS'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Usuários'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Relatórios'),
                        onTap: () {},
                      )
                    ],
                  ),
                ),

                const Expanded(child: AdminBooks())
              ],
            )
          ]),
    ),
  );
}
