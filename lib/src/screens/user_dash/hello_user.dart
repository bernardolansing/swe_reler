import 'package:flutter/material.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({super.key});

  String get _userFirstName => AppUser.displayName.split(' ').first;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightedText('olá, $_userFirstName'),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550, maxHeight: 210),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFA7BFD6),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(128),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 32, top: 32, right: 64, bottom: 48),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sua caixinha de fevereiro chega entre',
                          style: _boxArrivalTextStyle,
                        ),
                        SizedBox(height: 16),
                        Text('10/02 e 15/02', style: _datesTextStyle),
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
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child:
                      Image(image: AssetImage('assets/user-dash/bicycle.png')),
                ),
              ],
            ),
          )
        ],
      );

  static const _boxArrivalTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static const _datesTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B));
}
