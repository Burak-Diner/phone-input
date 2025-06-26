import 'package:flutter/material.dart';

class MainFormTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;

  const MainFormTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
      ),
      onChanged: onChanged,
    );
  }
}