import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const HighlightedText('olá, user'),
      const SizedBox(height: 16),

      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 210),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFA7BFD6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(128),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)
                  )
              ),
              child: const Padding(
                // padding: EdgeInsets.all(32),
                padding: EdgeInsets.only(
                    left: 32,
                    top: 32,
                    right: 64,
                    bottom: 48
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'sua caixinha de janeiro chega entre',
                      style: _boxArrivalTextStyle,
                    ),
                    SizedBox(height: 16),

                    Text('03/01 e 07/01', style: _datesTextStyle),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            const Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  SizedBox(width: 43),
                  Image(image: AssetImage('assets/user-dash/clouds.png')),
                ],
              ),
            )

          ],
        ),
      )
    ],
  );

  static const _boxArrivalTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black
  );

  static const _datesTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );
}
