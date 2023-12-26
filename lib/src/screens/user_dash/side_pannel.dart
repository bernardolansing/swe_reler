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
