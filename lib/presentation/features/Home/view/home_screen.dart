import 'package:flutter/material.dart';
import 'package:variety_app/core/app_strings.dart';
import 'package:variety_app/core/managers/alerts_manager.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/home/view/figma_bottom_nav_bar.dart';
import 'package:variety_app/presentation/features/Home/view/profile_screen.dart';
import 'package:variety_app/presentation/features/Store/Views/home/view/store_home_screen.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.name);
            },
          ),
        ],
        title: const Text(AppStrings.varietyApp),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          children: [
            AppButton(
              title: AppStrings.openBottomSheet,
              onPressed: () {
                AlertsManager.showBottomSheet(
                  context: context,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.bottomSheet,
                        style: TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        child: AppButton(
                          onPressed: () => Navigator.pop(context),
                          title: AppStrings.close,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            AppButton(
              title: AppStrings.storeApp,
              onPressed: () {
                Navigator.pushNamed(context, StoreHomeScreen.name);
              },
            ),
            const SizedBox(height: 16),
            AppButton(
              title: AppStrings.figmaTask,
              onPressed: () {
                Navigator.pushNamed(context, FigmaBottomNavBar.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
