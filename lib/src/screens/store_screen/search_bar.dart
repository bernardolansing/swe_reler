import 'package:flutter/material.dart';

class StoreSearchBar extends StatelessWidget {
  const StoreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(8), // Raio dos cantos arredondados
          border: Border.all(
            color: const Color(0xFFD6CAA7), // Cor da borda (outline)
            width: 2, // Largura da borda
          ),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(width: 1),
          const Expanded(child: TextFieldExample()),
          const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: SizedBox(
                  width: 2,
                  height: double.infinity,
                  child: ColoredBox(color: Color(0xFFD6CAA7)))),
          IconButton(
              icon: const Icon(Icons.search,
                  size: 25, color: Color.fromARGB(255, 206, 191, 146)),
              mouseCursor: MaterialStateMouseCursor.clickable,
              onPressed: () {})
        ]));
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextField(
          style: _textStyle,
          decoration: InputDecoration(
              filled: false,
              hintText: 'busque por obra ou brinde'
          ),
        ),
      ),
    );
  }
}

const _textStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    fontSize: 14,
    color: Color(0xFF4F493D));
