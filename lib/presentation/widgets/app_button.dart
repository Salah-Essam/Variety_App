// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:variety_app/core/app_strings.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
  });
  final VoidCallback onPressed;
  final String? title;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            backgroundColor ?? colorScheme.primary,
          ),
          foregroundColor: WidgetStateProperty.all(
            foregroundColor ?? colorScheme.onPrimary,
          ),
          textStyle: WidgetStateProperty.all(
            textStyle ??
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onPressed,
        child: Text(title ?? AppStrings.empty),
      ),
    );
  }
}
