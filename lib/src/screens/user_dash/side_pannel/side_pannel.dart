import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'flags.dart';
import 'package:swe_reler/src/widgets/drawer_menu_button.dart';

class SidePannel extends StatelessWidget {
  final bool loading;
  final bool error;

  const SidePannel({super.key, this.loading = false, this.error = false});

  double _computeSidePannelWidth(BuildContext context) {
    const minWidth = 300.0;
    const maxWidth = 415.0;
    const idealWidthFraction = 0.274;
    final screenWidth = MediaQuery.of(context).size.width;
    final idealSidePannelWidth = idealWidthFraction * screenWidth;

    if (idealSidePannelWidth < minWidth) { return minWidth; }
    if (idealSidePannelWidth > maxWidth) { return maxWidth; }
    return idealSidePannelWidth;
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Theme.of(context).colorScheme.secondary,
    child: SizedBox(
        width: _computeSidePannelWidth(context),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(48),
              child: Align(
                alignment: Alignment.centerRight,
                child: DrawerMenuButton(),
              ),
            ),

            LispectorsFlag(),
            SizedBox(height: 32),

            PointsFlag(),
            SizedBox(height: 32),

            Leaderboard(),
            SizedBox(height: 32),
          ],
        )
    ),
  );

  static const flagUpperText = Text(
      'você tem',
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w400,
      )
  );

  static const flagMainTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Teko',
    fontSize: 48,
    color: Colors.white,
    height: 0.5,
  );
}
