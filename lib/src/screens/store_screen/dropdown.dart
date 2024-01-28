// Import multiselct
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class Dropdown extends StatefulWidget {
  final List<String> options;
  final String hint;
  const Dropdown(this.options, this.hint, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropDownMultiSelect(
          onChanged: (List<String> x) {
            setState(() {
              selected = x;
            });
          },
          options: widget.options,
          selectedValues: selected,
          whenEmpty: widget.hint,
          hintStyle: _textStyle,
          selected_values_style: _textStyle,
          decoration: const InputDecoration(
            filled: false,
            labelStyle: _textStyle,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(0xFFD6CAA7), // Cor da borda (outline)
                    width: 2)),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}

const _textStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF4F493D));
