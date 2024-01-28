import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Raio dos cantos arredondados
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Image(image: AssetImage('/lordofrings.jpg')),
          SizedBox(height: 10),
          Text('Nome do livro', style: _textStyle1),
          SizedBox(height: 10),
          Row(children: [
            Icon(Icons.star, size: 20, color: Color(0xFF718E76)),
            Text('4.3', style: _textStyle2),
            SizedBox(width: 10),
            Text('R\$00,00', style: _textStyle2)
          ]),
          SizedBox(height: 10),
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
