import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/screens/store_screen/search_bar.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    //for (int i = 0; i < 12; i++) {
    for (Book b in bookCardList) {
      children.add(BookCard(
        title: b.title,
        evaluation: b.evaluation,
        price: b.price,
        picture: b.picture,
        author: b.author,
        genre: b.genre,
        resume: b.resume,
        quantity: b.quantity,
      ));
    }

    return Wrap(
      spacing: 60,
      children: children,
    );
  }
}

class BookCard extends StatefulWidget {
  final String title;
  final String evaluation;
  final String price;
  final String picture;
  final String author;
  final String genre;
  final String resume;
  final int quantity;
  const BookCard(
      {super.key,
      required this.title,
      required this.evaluation,
      required this.price,
      required this.picture,
      required this.author,
      required this.genre,
      required this.resume,
      required this.quantity});

  @override
  // ignore: library_private_types_in_public_api
  _BookCardState createState() => _BookCardState();
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
                        image: AssetImage(widget.picture),
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
                              widget.title,
                              textAlign: TextAlign.justify,
                            )
                          ]),
                          Row(children: [
                            const Text(
                              'Autor: ',
                              style: _textStyle4,
                            ),
                            Text(
                              widget.author,
                              textAlign: TextAlign.justify,
                            )
                          ]),
                          Row(children: [
                            const Text(
                              'Gênero: ',
                              style: _textStyle4,
                            ),
                            Text(
                              widget.genre,
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
                            widget.resume,
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
                              '${widget.quantity}',
                              textAlign: TextAlign.justify,
                            )
                          ])
                        ]),
                    Row(children: [
                      const Icon(Icons.star,
                          size: 30, color: Color(0xFF718E76)),
                      Text(widget.evaluation, style: _textStyle5),
                      const SizedBox(width: 10),
                      Text('R\$${widget.price}', style: _textStyle5)
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
                  Image(image: AssetImage(widget.picture)),
                  const SizedBox(height: 7),
                  Text(widget.title, style: _textStyle1),
                  const SizedBox(height: 7),
                  Row(children: [
                    const Icon(Icons.star, size: 20, color: Color(0xFF718E76)),
                    Text(widget.evaluation, style: _textStyle2),
                    const SizedBox(width: 10),
                    Text('R\$${widget.price}', style: _textStyle2)
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
    color: Color(0xFF9B693B));

const _textStyle2 =
    TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Colors.black);

const _textStyle3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color(0xFF9B693B));

const _textStyle4 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));

const _textStyle5 =
    TextStyle(fontFamily: 'Poppins', fontSize: 18, color: Colors.black);

const _textStyle6 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 29, 28, 28));

const _textStyle7 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 34, 68, 40));
