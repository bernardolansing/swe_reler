import 'package:flutter/material.dart';
import 'package:swe_reler/main.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/user.dart';

class CartCard extends StatelessWidget {
  final Book book;
  final VoidCallback callbck;
  const CartCard({super.key, required this.book, required this.callbck});

  @override
  Widget build(BuildContext context) => Column(children: [
    SizedBox(
      height: 125,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(book.picture)),
            const SizedBox(width: 30),

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: _importantTextStyle),

                  Text('Valor unitário: ${book.price.asPrice}'),

                  TextButton.icon(
                    onPressed: () {
                      AppUser.removeFromCart(book);
                      callbck();
                    },
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black),
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    ),
                    icon: const Icon(Icons.delete_forever_outlined),
                    label: const Text('excluir'),
                  )
                ]
            ),
          ]),
    ),

    const SizedBox(height: 30)
  ]);
}


const _importantTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));
