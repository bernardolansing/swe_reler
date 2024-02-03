import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/widgets/text_with_link_portion.dart';
import 'package:swe_reler/main.dart';

class CartCard extends StatefulWidget {
  final Book book;
  final VoidCallback callbck;
  const CartCard({super.key, required this.book, required this.callbck});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 125,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 90,
            height: 125,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.book.picture),
                fit: BoxFit.fill,
              ),
              borderRadius:
                  BorderRadius.circular(5), // Raio dos cantos arredondados
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  widget.book.title,
                  style: _importantTextStyle,
                ),
                Row(children: [
                  IconButton(
                      onPressed: () => setState(() {
                            if (widget.book.listQuantity > 1) {
                              widget.book.listQuantity--;
                              widget.callbck();
                            }
                          }),
                      icon: const Icon(Icons.remove_outlined,
                          size: 25, color: Colors.black)),
                  Text(
                    '${widget.book.listQuantity}',
                  ),
                  IconButton(
                      onPressed: () => setState(() {
                            if (widget.book.listQuantity <
                                widget.book.quantity) {
                              widget.book.listQuantity++;
                              widget.callbck();
                            }
                          }),
                      icon: const Icon(Icons.add_outlined,
                          size: 25, color: Colors.black)),
                  const Icon(Icons.delete_forever_outlined,
                      size: 25, color: Colors.black),
                  TextWithLinkPortion(
                    nonLinkPortion: '',
                    linkPortion: 'excluir',
                    onTap: () {
                      widget.book.listQuantity = 0;
                      selectedBooks.remove(widget.book);
                      widget.callbck();
                    },
                  ),
                ])
              ])),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('R\$${widget.book.price}'),
                Text(
                    'Total produto: R\$${(double.parse(widget.book.price) * widget.book.listQuantity).toStringAsFixed(2)}'),
              ]),
          const SizedBox(width: 20)
        ]),
      ),
      const SizedBox(height: 30)
    ]);
  }
}

const _importantTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));
