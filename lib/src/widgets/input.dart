import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool sensitive;
  final bool autoFocus;

  const Input({
    super.key,
    required this.title,
    required this.controller,
    this.sensitive = false,
    this.autoFocus = false,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(widget.title, style: Theme.of(context).textTheme.labelSmall),

      const SizedBox(height: 16),

      TextFormField(
        controller: widget.controller,
        obscureText: widget.sensitive,
        autofocus: widget.autoFocus,
      ),
    ],
  );
}