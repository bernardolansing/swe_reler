import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'flags.dart';
import 'package:swe_reler/src/widgets/drawer_menu_button.dart';

class SidePannel extends StatelessWidget {
  final bool loading;
  final bool error;

  const SidePannel({super.key, this.loading = false, this.error = false});

  /// Computes the width of this widget based on the screen resolution.
  double _computeSidePannelWidth(BuildContext context) {
    const minWidth = 300.0;
    const maxWidth = 415.0;
    const idealWidthFraction = 0.25;
    final screenWidth = MediaQuery.of(context).size.width;
    final idealSidePannelWidth = idealWidthFraction * screenWidth;

    if (idealSidePannelWidth < minWidth) { return minWidth; }
    if (idealSidePannelWidth > maxWidth) { return maxWidth; }
    return idealSidePannelWidth;
  }

  /// Computes the width to be assigned to the painters. The painters are the
  /// coloured Lispector's and points flags and leaderboard background.
  double _computePaintWidth(double pannelWidth) {
    const idealPaintWidthFraction = 0.85;
    const maxPaintWidth = 360.0;
    const minPaintWidth = 290.0;

    late final double width;
    final idealWidth = idealPaintWidthFraction * pannelWidth;
    if (idealWidth < minPaintWidth) { width = minPaintWidth; }
    else if (idealWidth > maxPaintWidth) { width = maxPaintWidth; }
    else { width = idealWidth; }

    return width;
  }

  @override
  Widget build(BuildContext context) {
    final sidePannelWidth = _computeSidePannelWidth(context);
    final paintWidth = _computePaintWidth(sidePannelWidth);

    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SizedBox(
            width: sidePannelWidth,
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

                SizedBox(
                  width: paintWidth,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LispectorsFlag(),
                      SizedBox(height: 32),

                      PointsFlag(),
                      SizedBox(height: 32),

                      Leaderboard(),
                      SizedBox(height: 32),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
