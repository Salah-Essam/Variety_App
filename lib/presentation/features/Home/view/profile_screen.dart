import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/managers/alerts_manager.dart';
import 'package:variety_app/presentation/features/auth/view/login_screen.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String name = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(radius: 64, child: Icon(Icons.person, size: 64)),
              Spacer(),
              AppButton(
                onPressed:
                    () => AlertsManager.showAppDialog(
                      text: "Are you sure you want to log out?",
                      context: context,
                      onPressedOk: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.name,
                          (r) => false,
                        );
                        AlertsManager.showSnackbar(
                          context: context,
                          text: "You have successfully logged out.",
                        );
                      },
                    ),
                title: "Sign out",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
