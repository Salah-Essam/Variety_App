import 'package:flutter/material.dart';
import 'package:variety_app/core/managers/alerts_manager.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_home.dart';
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
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.name);
            },
          ),
        ],
        title: Text("Variety App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          children: [
            AppButton(
              title: "Open Bottom Sheet",
              onPressed: () {
                AlertsManager.showBottomSheet(
                  context: context,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bottom Sheet", style: TextStyle(fontSize: 32)),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        child: AppButton(
                          onPressed: () => Navigator.pop(context),
                          title: "Close",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            AppButton(
              title: "Store App",
              onPressed: () {
                Navigator.pushNamed(context, StoreHomeScreen.name);
              },
            ),
            SizedBox(height: 16),
            AppButton(
              title: "Figma Task",
              onPressed: () {
                Navigator.pushNamed(context, FigmaHome.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
