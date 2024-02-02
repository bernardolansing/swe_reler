import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;

  const AppDialog({
    super.key,
    this.title,
    required this.content,
    this.actions
  });

  @override
  Widget build(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Color(0xFF4F493D)),
                textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                ))
            )
        )
    ),
    child: AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCloseDialogButton(context),
          const SizedBox(height: 32),

          if (title != null)
            _buildTitle(context),

          Flexible(child: SingleChildScrollView(child: content)),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: actions ?? _buildDefaultActions(context),
    ),
  );

  Widget _buildCloseDialogButton(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: IconButton(
      onPressed: Navigator.of(context).pop,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0x4CFFFFFF))
      ),
      icon: const Icon(Icons.close, size: 36),
    ),
  );

  Widget _buildTitle(BuildContext context) => Column(
    children: [
      Text(title!, style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 16),
    ],
  );

  List<Widget> _buildDefaultActions(BuildContext context) => [
    ElevatedButton(
      onPressed: Navigator.of(context).pop,
      child: const Text('Ok'),
    )
  ];
}
