import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swe_reler/src/screens/landing_page/landing_page_screen.dart';
import 'package:swe_reler/src/screens/login_screen.dart';
import 'package:swe_reler/src/theme.dart';
import 'firebase_options.dart';

void main() async {
  usePathUrlStrategy(); // select "path" URL strategy. By default, the strategy
  // is "hash". When in "hash" strategy, routes will be like "/#/login", instead
  // of just "/login".
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ReLerApp());
}

class ReLerApp extends StatelessWidget {
  const ReLerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'ReLer',
    theme: theme,
    // We set a custom builder to wrap all app routes with a SelectionArea
    // widget. Otherwise, we would have to put it as a child of every Scaffold
    // manually. For this to work, we have to manually create a Overlay widget
    // and add the wrapped route as a OverlayEntry.
    builder: (context, child) => Overlay(
        initialEntries: [
          OverlayEntry(builder: (context) => SelectionArea(child: child!))
        ]
    ),
    routes: {
      '/': (context) => LandingPageScreen(),
      '/login': (context) => LoginScreen(),
    },
  );
}
