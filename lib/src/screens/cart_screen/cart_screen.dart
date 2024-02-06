import 'package:flutter/material.dart';
import 'package:swe_reler/main.dart';
import 'package:swe_reler/src/screens/cart_screen/cart_card.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreentate();
}

class _CartScreentate extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 30),

                const HighlightedText('carrinho de compras'),
                const SizedBox(height: 30),

                Expanded(child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _cartItemsCards
                          ),
                        )
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const _PurchaseBriefing(),

                        const SizedBox(height: 24),

                        ElevatedButton(
                          onPressed: () {
                            if (AppUser.cartItems.isEmpty) { return; }
                            AppUser.purchaseBooks();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Finalizar compra'),
                        )
                      ],
                    ),

                    const Spacer(),
                  ],
                )),
              ]),
        ));
  }

  List<Widget> get _cartItemsCards => AppUser.cartItems
      .map((item) => CartCard(book: item, callbck: () => setState(() {})))
      .toList();
}

class _PurchaseBriefing extends StatelessWidget {
  const _PurchaseBriefing();

  @override
  Widget build(BuildContext context) => Container(
    width: 305,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8)
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'resumo do pedido:',
            style: _titleTextStyle,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                      '${AppUser.cartItems.length} produtos',
                      style: _labelTextStyle
                  ),

                  _spacing,
                  _divider,
                  _spacing,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('entrega', style: _labelTextStyle),
                      Text(0.0.asPrice),
                    ],
                  ),

                  _spacing,
                  _divider,
                  _spacing,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('total', style: _labelTextStyle),
                      Text(_purchaseValue.asPrice),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  static double get _purchaseValue => AppUser.cartItems
      .fold(0, (acc, val) => acc + val.price);

  static const _spacing = SizedBox(height: 8);

  static const _divider = Divider(
      height: 2,
      thickness: 2,
      color: Color(0xFFD6CAA7)
  );

  static const _titleTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: Colors.black
  );

  static const _labelTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );
}
