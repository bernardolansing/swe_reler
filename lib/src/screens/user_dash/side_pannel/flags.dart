import 'dart:math';
import 'package:flutter/material.dart';

abstract class _Flag extends StatelessWidget {
  const _Flag({super.key});

  CustomPainter get _painter;
  String get _mainText;

  Size _computePaintSize(BoxConstraints constraints) {
    const idealPaintWidthMultiplier = 0.85;
    const maxPaintWidth = 360.0;
    const minPaintWidth = 290.0;
    const paintHeight = 100.0;

    late final double width;
    final idealWidth = idealPaintWidthMultiplier * constraints.maxWidth;
    if (idealWidth < minPaintWidth) { width = minPaintWidth; }
    else if (idealWidth > maxPaintWidth) { width = maxPaintWidth; }
    else { width = idealWidth; }

    return Size(width, paintHeight);
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      LayoutBuilder(
        builder: (context, constraints) => CustomPaint(
          painter: _painter,
          size: _computePaintSize(constraints),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _flagUpperText,
            const SizedBox(height: 16),
            Text(_mainText, style: _flagMainTextStyle),
          ],
        ),
      ),
    ],
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

class LispectorsFlag extends _Flag {
  const LispectorsFlag({super.key});

  @override
  String get _mainText => "100 Lispector's";

  @override
  CustomPainter get _painter => _LispectorsPainter();
  
}

class _LispectorsPainter extends CustomPainter {
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

class PointsFlag extends _Flag {
  const PointsFlag({super.key});

  @override
  String get _mainText => '100 pontos';

  @override
  CustomPainter get _painter => _PointsPainter();
}

class _PointsPainter extends CustomPainter {
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
