// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
  });
  final VoidCallback onPressed;
  final String? title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
          foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onPressed,
        child: Text(title ?? ""),
      ),
    );
  }
}
