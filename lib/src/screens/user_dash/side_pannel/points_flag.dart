import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/user_dash/side_pannel/side_pannel.dart';

class PointsFlag extends StatelessWidget {
  const PointsFlag({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      CustomPaint(
          painter: _Painter(),
          size: const Size(280, 100) // TODO: adjust to fit parent
        // width.
      ),

      const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidePannel.flagUpperText,
            SizedBox(height: 16),
            Text("100 pontos", style: SidePannel.flagMainTextStyle),
          ],
        ),
      ),
    ],
  );
}

class _Painter extends CustomPainter {
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
