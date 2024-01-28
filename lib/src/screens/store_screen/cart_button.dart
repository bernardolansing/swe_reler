import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  /// Pushes the given route to the Navigator if it isn't already the
  /// current route.
  void _pushIfNotCurrent(BuildContext context, String route) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    // User requested to navigate to a route other than the current.
    if (currentRoute != null && !currentRoute.endsWith(route)) {
      Navigator.of(context).pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () => _pushIfNotCurrent(context, '/cart'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.white.withAlpha(76))),
          icon: const Icon(Icons.shopping_cart_outlined, size: 36),
        ),
      );
}
