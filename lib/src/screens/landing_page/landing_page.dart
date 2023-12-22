import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/landing_page/how-it-works.dart';
import 'package:swe_reler/src/screens/landing_page/introduction.dart';
import 'package:swe_reler/src/screens/landing_page/navbar.dart';
import 'package:swe_reler/src/screens/landing_page/whats_in_the_box.dart';

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
        HowItWorks(),
        WhatsInTheBox(),
      ],
    )),
  );
}


