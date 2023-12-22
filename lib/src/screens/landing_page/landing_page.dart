import 'package:flutter/material.dart';
import 'how-it-works.dart';
import 'introduction.dart';
import 'navbar.dart';
import 'plans.dart';
import 'whats_in_the_box.dart';
import 'footer.dart';

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
        Plans(),
        Footer(),
      ],
    )),
  );
}


