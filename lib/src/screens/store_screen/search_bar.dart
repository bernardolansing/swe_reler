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
        child:
            const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 1),
          Expanded(child: TextFieldExample()),
          Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: SizedBox(
                  width: 2,
                  height: double.infinity,
                  child: ColoredBox(color: Color(0xFFD6CAA7)))),
          IconButton(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onPressed: null,
            icon: Icon(Icons.search,
                size: 25, color: Color.fromARGB(255, 206, 191, 146)),
          )
        ]));
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          style: _textStyle,
          decoration: const InputDecoration(
              filled: false, hintText: 'busque por obra ou brinde'),
          controller: _controller,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: Text(
                      'You typed "$value", which has length ${value.characters.length}.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
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
