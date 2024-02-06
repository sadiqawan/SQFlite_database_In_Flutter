import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType keybordType;
  final initilaValue;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.keybordType,
    this.initilaValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initilaValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      keyboardType: keybordType,
    );
  }
}
