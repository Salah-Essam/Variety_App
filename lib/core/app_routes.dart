import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/figma_home.dart';
import 'package:variety_app/presentation/features/Home/view/home_screen.dart';
import 'package:variety_app/presentation/features/Home/view/profile_screen.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/product_details_screen.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/products_screen.dart';
import 'package:variety_app/presentation/features/Store/Views/home/view/store_home_screen.dart';
import 'package:variety_app/presentation/features/auth/view/login_screen.dart';
import 'package:variety_app/presentation/features/auth/view/sing_up_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    FigmaHome.name: (context) => const FigmaHome(),
    ProductDetailsScreen.name: (context) => const ProductDetailsScreen(),
    ProductsScreen.name: (context) => const ProductsScreen(),
    StoreHomeScreen.name: (context) => const StoreHomeScreen(),
    ProfileScreen.name: (context) => const ProfileScreen(),
    SignUpScreen.name: (context) => const SignUpScreen(),
    LoginScreen.name: (context) => const LoginScreen(),
    HomeScreen.name: (context) => const HomeScreen(),
  };
}
