import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 38),
    decoration: _backgroundDecoration,
    child: SizedBox(
      width: double.infinity,
      height: 600,
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: _pannelDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 150),
          child: Column(
            children: [
              Spacer(),
              Text('descubra novos universos!'),
              Text('receba todos os meses livros seminovos e usados '
                  'selecionados especialmente para você.'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('assinar'),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    ),
  );

  static const _backgroundDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/landing-page/introduction-background.jpeg'),
        fit: BoxFit.cover,
        alignment: FractionalOffset.center
    ),
  );

  static const _pannelDecoration = BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/landing-page/pannel-shape.png'),
          alignment: Alignment.centerLeft
      )
  );
}
