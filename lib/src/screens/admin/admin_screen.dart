import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/admin/books.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

enum _AdminMenu {
  books('livros', AdminBooks()),
  gifts('brindes', null),
  boks('BOKS', null),
  users('usuários', null),
  reports('relatórios', null);
  
  final String title;
  // Nullable for now as not all menus are implemented yet:
  final Widget? widget;
  
  const _AdminMenu(this.title, this.widget);
}

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  _AdminMenu _selectedMenu = _AdminMenu.books;

  void _switchMenu(_AdminMenu menu) {
    // Ensure that the menu is in fact implemented. If it is not, do not switch.
    if (menu.widget != null) { setState(() => _selectedMenu = menu); }
  }

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
                      const SizedBox(height: 16),

                      ..._AdminMenu.values.map(_buildMenuListTile),
                      // ListTile(
                      //   title: const Text('livros'),
                      //   dense: true,
                      //   onTap: () {},
                      // ),
                      // ListTile(
                      //   title: const Text('brindes'),
                      //   onTap: () {},
                      // ),
                      // ListTile(
                      //   title: const Text('BOKS'),
                      //   onTap: () {},
                      // ),
                      // ListTile(
                      //   title: const Text('usuários'),
                      //   onTap: () {},
                      // ),
                      // ListTile(
                      //   title: const Text('relatórios'),
                      //   onTap: () {},
                      // )
                    ],
                  ),
                ),

                const SizedBox(width: 40),
                
                Expanded(child: _selectedMenu.widget!)
              ],
            )
          ]
      ),
    ),
  );

  Widget _buildMenuListTile(_AdminMenu menu) => ListTile(
    onTap: () => _switchMenu(menu),
    dense: false,
    selected: _selectedMenu == menu,
    title: Text(menu.title, style: _menuOptionTextStyle),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
    ),
    selectedTileColor: const Color(0xFFD6CAA7),
  );

  static const _menuOptionTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );
}
