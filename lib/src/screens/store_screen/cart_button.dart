import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: IconButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white.withAlpha(76))
      ),
      icon: const Icon(Icons.shopping_cart_outlined, size: 36),
    ),
  );
}
