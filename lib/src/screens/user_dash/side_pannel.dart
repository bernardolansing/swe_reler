import 'dart:math';
import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/drawer_menu_button.dart';

class SidePannel extends StatelessWidget {
  final bool loading;
  final bool error;

  const SidePannel({super.key, this.loading = false, this.error = false});

  @override
  Widget build(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 300,
            maxWidth: 300,
            minHeight: MediaQuery.of(context).size.height
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(48),
              child: Align(
                alignment: Alignment.centerRight,
                child: DrawerMenuButton(),
              ),
            ),

            // Lispector's flag:
            Stack(
              children: [
                CustomPaint(
                    painter: _LispectorsFlagPainter(),
                    size: const Size(280, 100) // TODO: adjust to fit parent
                  // width.
                ),

                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _flagUpperText,
                      SizedBox(height: 16),
                      Text("100 Lispector's", style: _flagMainTextStyle),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Points flag:
            Stack(
              children: [
                CustomPaint(
                    painter: _PointsArrowPainter(),
                    size: const Size(280, 100) // TODO: adjust to fit parent
                  // width.
                ),

                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _flagUpperText,
                      SizedBox(height: 16),
                      Text("100 pontos", style: _flagMainTextStyle),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Leaderboard:
            Stack(
              children: [
                CustomPaint(
                    painter: _LeaderboardPainter(),
                    size: const Size(280, 600)
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 16,
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
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      )
  );

  static const _flagUpperText = Text(
      'você tem',
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w400,
      )
  );

  static const _flagMainTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Teko',
    fontSize: 48,
    color: Colors.white,
    height: 0.5,
  );
}

class _LispectorsFlagPainter extends CustomPainter {
  static const _cutoutWidth = 64;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF9B693B)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width - _cutoutWidth, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  // TODO: check if we can avoid repainting.
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _PointsArrowPainter extends CustomPainter {
  static const _arrowTipWidth = 64;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF718E76)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..lineTo(size.width - _arrowTipWidth, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - _arrowTipWidth, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _LeaderboardPainter extends CustomPainter {
  static const _ellipsisMinorRadius = 40.0;
  static const _ellipsisGreaterRadius = 70.0;
  static const _borderRadius = 16.0;

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
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withAlpha(89),
      ),
      child: SizedBox(
        width: 205,
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
                      style: textTheme.headlineSmall,
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
                    // const SizedBox(height: 16),
                    Text('$points pontos'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static const _usernameTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
