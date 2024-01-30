import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < 12; i++) {
      children.add(BookCard(
          title: bookCardList[i].title,
          evaluation: bookCardList[i].evaluation,
          price: bookCardList[i].price,
          picture: bookCardList[i].picture));
    }

    return Wrap(
      spacing: 60,
      children: children,
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String evaluation;
  final String price;
  final String picture;
  const BookCard(
      {super.key,
      required this.title,
      required this.evaluation,
      required this.price,
      required this.picture});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Raio dos cantos arredondados
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Image(image: AssetImage(picture)),
          const SizedBox(height: 7),
          Text(title, style: _textStyle1),
          const SizedBox(height: 7),
          Row(children: [
            const Icon(Icons.star, size: 20, color: Color(0xFF718E76)),
            Text(evaluation, style: _textStyle2),
            const SizedBox(width: 10),
            Text(price, style: _textStyle2)
          ]),
        ],
      ),
    );
  }
}

const _textStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));

const _textStyle2 =
    TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Colors.black);
