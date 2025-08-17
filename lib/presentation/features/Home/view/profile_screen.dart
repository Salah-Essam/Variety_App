import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/app_strings.dart';
import 'package:variety_app/core/managers/alerts_manager.dart';
import 'package:variety_app/core/managers/Firebase/firebase_auth_manager.dart';
import 'package:variety_app/core/managers/shared_preferences_manager.dart';
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
              const CircleAvatar(
                radius: 64,
                child: Icon(Icons.person, size: 64),
              ),
              const Spacer(),
              AppButton(
                onPressed:
                    () => AlertsManager.showAppDialog(
                      text: AppStrings.areYouSureYouWantToLogOut,
                      context: context,
                      onPressedOk: () {
                        FirebaseManager.instance.signOut();
                        SharedPreferencesManager.removeToken();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.name,
                          (r) => false,
                        );
                        AlertsManager.showSnackbar(
                          context: context,
                          text: AppStrings.youHaveSuccessfullyLoggedOut,
                        );
                      },
                    ),
                title: AppStrings.signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
