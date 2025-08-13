import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_favorites.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_home.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_notifications.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_profile.dart';

class FigmaBottomNavBar extends StatelessWidget {
  const FigmaBottomNavBar({super.key});

  static const String name = "figmaBottomNavBar";

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const FigmaHome(),
      item: ItemConfig(
        icon: Icon(Icons.home, color: AppColors.black),
        inactiveIcon: Icon(Icons.home_outlined, color: AppColors.black),
      ),
    ),
    PersistentTabConfig(
      screen: const FigmaFavorites(),
      item: ItemConfig(
        icon: Icon(Icons.favorite, color: AppColors.black),
        inactiveIcon: Icon(Icons.favorite_outline, color: AppColors.black),
      ),
    ),
    PersistentTabConfig(
      screen: const FigmaNotifications(),
      item: ItemConfig(
        icon: Icon(Icons.notifications, color: AppColors.black),
        inactiveIcon: Icon(
          Icons.notifications_outlined,
          color: AppColors.black,
        ),
      ),
    ),
    PersistentTabConfig(
      screen: const FigmaProfile(),
      item: ItemConfig(
        icon: Icon(Icons.person, color: AppColors.black),
        inactiveIcon: Icon(Icons.person_outlined, color: AppColors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (p0) => NeumorphicBottomNavBar(navBarConfig: p0),
    );
  }
}
