import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/drawer_menu_button.dart';

class SidePannel extends StatelessWidget {
  final bool loading;
  final bool error;

  const SidePannel({super.key, this.loading = false, this.error = false});

  @override
  Widget build(BuildContext context) => ColoredBox(
      color: Theme.of(context).colorScheme.secondary,
      child: Flexible(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300,
            minHeight: MediaQuery.of(context).size.height
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(48),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DrawerMenuButton(),
                ),
              )
            ],
          ),
        ),
      )
  );
}
