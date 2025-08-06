// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/validators/app_validator.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.onChange,
    this.type,
    this.isObscure,
    this.style,
    this.labelText,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.textInputAction,
    this.validator,
  });
  final TextEditingController controller;
  final Function(String)? onChange;
  final TextInputType? type;
  final bool? isObscure;
  final TextStyle? style;
  final String? labelText;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputAction? textInputAction;
  final AppValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
          obscureText: isObscure ?? false,
          style: style,
          textInputAction: textInputAction,
        ),
        if (validator != null) getValidationHints(),
      ],
    );
  }

  Widget getValidationHints() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...validator!.reasons.map(
          (e) => Column(
            children: [
              const SizedBox(height: 5),
              Text(e, style: TextStyle(color: AppColors.red, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
