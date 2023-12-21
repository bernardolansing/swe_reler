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
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Column(
            children: [
              const Spacer(),

              Text(
                  'descubra novos universos!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: 500,
                child: Text(
                  'receba todos os meses livros seminovos e usados '
                      'selecionados especialmente para você.',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {},
                child: const Text('assinar'),
              ),

              const Spacer(),
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
