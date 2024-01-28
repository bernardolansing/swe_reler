import 'package:flutter/material.dart';

enum InputType {
  email,
  password,
  text,
}

class Input extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final InputType type;
  final bool autoFocus;
  final String? errorMessage;
  final void Function()? errorDismisser;

  const Input({
    super.key,
    required this.title,
    required this.controller,
    this.type = InputType.text,
    this.autoFocus = false,
    this.errorMessage,
    this.errorDismisser,
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
        obscureText: widget.type == InputType.password,
        autofocus: widget.autoFocus,
        keyboardType: widget.type == InputType.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        onChanged: (value) {
          if (widget.errorMessage != null) {
            assert (widget.errorDismisser != null);
            widget.errorDismisser!();
          }
        },
        decoration: InputDecoration(errorText: widget.errorMessage),
      ),
    ],
  );
}
