import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class WhatsInTheBox extends StatelessWidget {
  const WhatsInTheBox({super.key});

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = Theme.of(context).textTheme.labelSmall;

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 500,
              width: 500,
              child: Image(
                  image: AssetImage('assets/landing-page/whats-in-the-box.jpeg')
              ),
            ),

            const SizedBox(width: 64),

            Flexible(child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HighlightedText('o que vem na caixa?'),
                  const SizedBox(height: 32),

                  Text('livros.', style: labelTextStyle),
                  const SizedBox(height: 16),
                  const Text('selecionados de acordo com as suas '
                      'preferências.'),
                  const SizedBox(height: 32),

                  Text('papelaria.', style: labelTextStyle),
                  const SizedBox(height: 16),
                  const Text('marcadores de página, canetas, post-its, '
                      'pesos de papel e outras bugigangas.'),
                  const SizedBox(height: 32),

                  Text('autocuidado.', style: labelTextStyle),
                  const SizedBox(height: 16),
                  const Text('Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit.'),
                  const SizedBox(height: 32),

                  Text('snacks e bebidas.', style: labelTextStyle),
                  const SizedBox(height: 16),
                  const Text('quem não gosta de um cafezinho com cookies '
                      'na hora de ler um bom livro?'),
                  const SizedBox(height: 32),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
