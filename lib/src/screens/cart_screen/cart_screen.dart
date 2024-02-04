import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/cart_screen/cart_card.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/screens/store_screen/book_list.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreentate();
}

class _CartScreentate extends State<CartScreen> {
  /// Pushes the given route to the Navigator if it isn't already the
  /// current route.
  void _pushIfNotCurrent(BuildContext context, String route) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    // User requested to navigate to a route other than the current.
    if (currentRoute != null && !currentRoute.endsWith(route)) {
      Navigator.of(context).pushNamed(route);
    }
  }

  void _refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bookCartList = [];
    double totalValue = 0;
    int totalItens = 0;
    for (Book b in selectedBooks) {
      bookCartList.add(CartCard(
        book: b,
        callbck: _refreshScreen,
      ));
      totalValue += double.parse(b.price) * b.listQuantity;
      totalItens += b.listQuantity;
    }
    return Scaffold(
        endDrawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [DrawerMenuButton()],
            ),
            const SizedBox(height: 30),
            const HighlightedText('carrinho de compras'),
            const SizedBox(height: 30),
            Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SingleChildScrollView(
                      child: SizedBox(
                    width: 700,
                    child: Column(children: bookCartList),
                  )),
                  const Expanded(child: SizedBox()),
                  IntrinsicHeight(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 204, 189, 142),
                          borderRadius: BorderRadius.circular(
                              10), // Raio dos cantos arredondados
                        ),
                        width: 305,
                        height: 305,
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'resumo do pedido:',
                                    style: _resumoTextStyle,
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE1DBC9),
                                          borderRadius: BorderRadius.circular(
                                              10), // Raio dos cantos arredondados
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${totalItens.toString()} produtos',
                                                  style: _importantTextStyle,
                                                ),
                                                const SizedBox(height: 20),
                                                const SizedBox(
                                                    width: double.infinity,
                                                    height: 2,
                                                    child: ColoredBox(
                                                        color:
                                                            Color(0xFFD6CAA7))),
                                                const SizedBox(height: 20),
                                                const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'entrega',
                                                        style:
                                                            _importantTextStyle,
                                                      ),
                                                      Text(
                                                        'R\$0.00',
                                                      )
                                                    ]),
                                                const SizedBox(height: 20),
                                                const SizedBox(
                                                    width: double.infinity,
                                                    height: 2,
                                                    child: ColoredBox(
                                                        color:
                                                            Color(0xFFD6CAA7))),
                                                const SizedBox(height: 20),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'total',
                                                        style:
                                                            _importantTextStyle,
                                                      ),
                                                      Text(
                                                        'R\$${totalValue.toStringAsFixed(2)}',
                                                      )
                                                    ]),
                                              ]),
                                        )),
                                  )
                                ])),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          if (totalItens > 0) {
                            SnackBar snackBar = const SnackBar(
                              content: Text('Compra realizada'),
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            for (Book b in bookList) {
                              b.quantity -= b.listQuantity;
                              b.listQuantity = 0;
                            }
                            selectedBooks.clear();
                            _pushIfNotCurrent(context, '/dash');
                          }
                        },
                        child: const Text(
                          'finalizar compra',
                          style: _buttonTextStyle,
                        ),
                      ),
                    ],
                  ))
                ])),
          ]),
        ));
  }
}

const _importantTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));

const _buttonTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white);

const _resumoTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.black);
