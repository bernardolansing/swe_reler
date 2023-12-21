import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/landing_page/introduction.dart';
import 'package:swe_reler/src/screens/landing_page/navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  MaterialPageRoute route(BuildContext context) => MaterialPageRoute(
      builder: (context) => const LandingPage()
  );

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SingleChildScrollView(child: Column(
      children: [
        NavBar(),
        Introduction(),
      ],
    )),
  );
}


