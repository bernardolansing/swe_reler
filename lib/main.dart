import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:universal_html/html.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/screens/cart_screen/cart_screen.dart';
import 'package:swe_reler/src/screens/purchase_report_screen.dart';
import 'package:swe_reler/src/screens/redirection_screen.dart';
import 'src/screens/landing_page/landing_page_screen.dart';
import 'src/screens/admin/admin_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/sign_up_screen.dart';
import 'src/screens/store_screen/book.dart';
import 'src/screens/user_dash/user_dash_screen.dart';
import 'src/screens/store_screen/store_screen.dart';
import 'src/theme.dart';
import 'src/user.dart';
import 'firebase_options.dart';

List<Book> selectedBooks = [];

void main() async {
  usePathUrlStrategy(); // Select "path" URL strategy. By default, the strategy
  // is "hash". When in "hash" strategy, routes will be like "/#/login", instead
  // of just "/login".
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppUser.initialize();
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
    builder: (context, child) => Overlay(initialEntries: [
      OverlayEntry(builder: (context) => SelectionArea(child: child!))
    ]),
    routes: {
      '/': (context) => LandingPageScreen(),
      '/store': (context) => AppUser.signedIn
          ? const StoreScreen()
          : LandingPageScreen(),
      '/cart': (context) => AppUser.signedIn
          ? const CartScreen()
          : LandingPageScreen(),
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignUpScreen(),
      '/dash': (context) => AppUser.signedIn
          ? const UserDashScreen()
          : LandingPageScreen(),
      '/purchase-report': (context) => AppUser.signedIn
          ? const PurchaseReportScreen()
          : LandingPageScreen(),
      '/admin': (context) => _authorizeAdminRoute(const AdminScreen()),
    },
  );
}

Widget _authorizeAdminRoute(Widget screen) {
  if (AppUser.signedIn && AppUser.isAdmin) { return screen; }
  else {
    window.location.href = '/';
    return const RedirectionScreen();
  }
}

extension PriceFormatter on double {
  String get asPrice {
    final cents = ((this - toInt()) * 100).toInt();
    return 'R\$ ${toInt()},$cents';
  }
}
