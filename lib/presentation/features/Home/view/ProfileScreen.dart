import 'package:flutter/material.dart';
import 'package:variety_app/core/AppColors.dart';
import 'package:variety_app/presentation/features/auth/view/LoginScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String name = "profile";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                onPressed: () {
                  showDialog(
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
                          "Are you sure you want to log out?",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: AppButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginScreen.name,
                                  (r) => false,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.primary
                                        .withAlpha(150),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                    duration: Durations.extralong4,
                                    content: Text(
                                      "You have successfully logged out.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              title: "OK",
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  //
                },
                title: "Sign out",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
