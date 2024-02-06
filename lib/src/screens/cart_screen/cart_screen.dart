import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/cart_screen/cart_card.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreentate();
}

class _CartScreentate extends State<CartScreen> {
  void _refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bookCartList = [];
    double totalValue = 0;
    int totalItens = 0;
    for (Book b in AppUser.cartItems) {
      bookCartList.add(CartCard(
        book: b,
        callbck: _refreshScreen,
      ));
      totalValue += b.price;
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
                                  if (AppUser.cartItems.isEmpty) { return; }
                                  AppUser.purchaseBooks();
                                  Navigator.of(context).pop();
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
