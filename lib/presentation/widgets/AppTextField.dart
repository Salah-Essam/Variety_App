// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.onChange,
    this.type,
    this.isObscure = false,
    this.style,
    this.labelText,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
  });
  final TextEditingController controller;
  final Function(String)? onChange;
  final TextInputType? type;
  final bool isObscure;
  final TextStyle? style;
  final String? labelText;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      keyboardType: type,
      obscureText: isObscure,
      style: style,
    );
  }
}
