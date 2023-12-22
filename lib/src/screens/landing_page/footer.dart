import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) => ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 78,
                  width: 78,
                  child: Image(image: AssetImage('assets/logo78-black.png')),
                ),

                SizedBox(width: 8),

                Text('RELER', style: _logoTextStyle)
              ],
            ),

            const SizedBox(height: 32),

            const Text('nos contate nas redes!'),

            const SizedBox(height: 16),

            Wrap(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.black
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      FontAwesomeIcons.youtube,
                      color: Colors.black
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.black
                  ),
                ),
              ],
            )
          ],
        ),
      )
  );

  static const _logoTextStyle = TextStyle(
      fontFamily: 'Bebas Neue',
      fontSize: 74,
      fontWeight: FontWeight.w400,
      color: Colors.black
  );
}
