import 'dart:math';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  static const _leaderboardHeight = 600.0;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Stack(
      children: [
        CustomPaint(
          painter: _Painter(),
          size: Size(constraints.maxWidth, _leaderboardHeight),
        ),

        SizedBox(
            width: _Painter.getContentWidth(constraints.maxWidth),
            height: _leaderboardHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'leaderboard',
                      style: Theme.of(context).textTheme.headlineSmall
                  ),

                  ...Iterable.generate(5, (index) => _LeaderboardCard(
                      username: 'Usuário X',
                      points: 100,
                      rank: index + 1
                  )),
                ],
              ),
            )
        ),
      ],
    ),
  );
}

class _Painter extends CustomPainter {
  static const _ellipsisMinorRadius = 40.0;
  static const _ellipsisGreaterRadius = 70.0;
  static const _borderRadius = 16.0;

  static double getContentWidth(double paintWidth) =>
      paintWidth - _ellipsisMinorRadius;

  Rect _getEllipsisPosition(Size size) => Rect.fromLTRB(
      size.width - 2 * _ellipsisMinorRadius,
      0,
      size.width,
      2.0 * _ellipsisGreaterRadius
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFE2A447)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..lineTo(size.width - _ellipsisMinorRadius, 0)
      ..lineTo(size.width - _ellipsisMinorRadius, size.height - _borderRadius)
      ..quadraticBezierTo(size.width - _ellipsisMinorRadius,
          size.height,
          size.width - _ellipsisMinorRadius - _borderRadius,
          size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..addArc(_getEllipsisPosition(size), - pi / 2, pi);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _LeaderboardCard extends StatelessWidget {
  final String username;
  final int points;
  final int rank;

  const _LeaderboardCard({
    required this.username,
    required this.points,
    required this.rank
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white.withAlpha(89),
    ),
    child: SizedBox(
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),

            const VerticalDivider(
                thickness: 2,
                width: 2,
                color: Color(0xFFE2A447)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8
              ),
              child: Column(
                children: [
                  Text(username, style: _usernameTextStyle),
                  Text('$points pontos'),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

  static const _usernameTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
