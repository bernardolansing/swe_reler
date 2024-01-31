import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 60,
    children: bookCardList
        .map((book) => BookCard(book))
        .toList(growable: false),
  );
}

class BookCard extends StatefulWidget {
  final Book book;

  const BookCard(this.book, {super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          setState(() {});
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentTextStyle: _textStyle3,
                scrollable: true,
                content: SizedBox(
                  width: 500,
                  child: Column(children: [
                    Image(
                        image: AssetImage(widget.book.picture),
                        width: 250,
                        height: 400),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Text(
                              'Título: ',
                              style: _textStyle4,
                            ),
                            Text(
                              widget.book.title,
                              textAlign: TextAlign.justify,
                            )
                          ]),
                          Row(children: [
                            const Text(
                              'Autor: ',
                              style: _textStyle4,
                            ),
                            Text(
                              widget.book.author,
                              textAlign: TextAlign.justify,
                            )
                          ]),
                          Row(children: [
                            const Text(
                              'Gênero: ',
                              style: _textStyle4,
                            ),
                            Text(
                              widget.book.genres.map((g) => g.title).join(', '),
                              textAlign: TextAlign.justify,
                            )
                          ]),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 2,
                                  child: ColoredBox(color: Color(0xFF9B693B)))),
                          Text(
                            widget.book.resume,
                            textAlign: TextAlign.justify,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 2,
                                  child: ColoredBox(color: Color(0xFF9B693B)))),
                          Row(children: [
                            const Text(
                              'Exemplares disponíveis: ',
                              style: _textStyle4,
                            ),
                            Text(
                              '${widget.book.quantity}',
                              textAlign: TextAlign.justify,
                            )
                          ])
                        ]),
                    Row(children: [
                      const Icon(Icons.star,
                          size: 30, color: Color(0xFF718E76)),
                      Text(widget.book.evaluation, style: _textStyle5),
                      const SizedBox(width: 10),
                      Text('R\$${widget.book.price}', style: _textStyle5)
                    ])
                  ]),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                    const Text('Adicionar no carrinho', style: _textStyle7),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Fechar', style: _textStyle6),
                  ),
                ],
              );
            },
          );
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 100,
              height: 235,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(10), // Raio dos cantos arredondados
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image(image: AssetImage(widget.book.picture)),
                  const SizedBox(height: 7),
                  Text(widget.book.title, style: _textStyle1),
                  const SizedBox(height: 7),
                  Row(children: [
                    const Icon(Icons.star, size: 20, color: Color(0xFF718E76)),
                    Text(widget.book.evaluation, style: _textStyle2),
                    const SizedBox(width: 10),
                    Text('R\$${widget.book.price}', style: _textStyle2)
                  ]),
                ],
              ),
            )));
  }
}

const _textStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B)
);

const _textStyle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    color: Colors.black
);

const _textStyle3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color(0xFF9B693B)
);

const _textStyle4 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B)
);

const _textStyle5 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    color: Colors.black
);

const _textStyle6 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 29, 28, 28)
);

const _textStyle7 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 34, 68, 40)
);
