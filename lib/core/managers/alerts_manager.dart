import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';

class AlertsManager {
  static void showBottomSheet({
    required BuildContext context,
    double? height,
    double? width,
    required Widget child,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: height ?? 250,
          width: width ?? double.infinity,
          child: child,
        );
      },
    );
  }

  static Future<dynamic> showAppDialog({
    required String text,
    required BuildContext context,
    required VoidCallback onPressedOk,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.warning_amber_rounded,
              color: const Color.fromARGB(255, 217, 163, 0),
              size: 50,
            ),
          ),
          content: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: AppButton(onPressed: onPressedOk, title: "OK"),
            ),
          ],
        );
      },
    );
  }

  static void showSnackbar({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primary.withAlpha(150),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        duration: Durations.extralong4,
        content: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
