import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'how_it_works.dart';
import 'introduction.dart';
import 'navbar.dart';
import 'plans.dart';
import 'whats_in_the_box.dart';
import 'footer.dart';

class LandingPageScreen extends StatelessWidget {
  final _sectionKeys = List.generate(4, (index) => GlobalKey());

  LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    endDrawer: const DrawerMenu(),
    body: SingleChildScrollView(child: Column(
      children: [
        NavBar(sectionKeys: _sectionKeys),
        const Introduction(),
        HowItWorks(key: _sectionKeys[0]),
        WhatsInTheBox(key: _sectionKeys[1]),
        Plans(key: _sectionKeys[2]),
        Footer(key: _sectionKeys[3]),
      ],
    )),
  );
}
