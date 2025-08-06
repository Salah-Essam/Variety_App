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
    FigmaHome.name: (context) => FigmaHome(),
    ProductDetailsScreen.name: (context) => ProductDetailsScreen(),
    ProductsScreen.name: (context) => ProductsScreen(),
    StoreHomeScreen.name: (context) => StoreHomeScreen(),
    ProfileScreen.name: (context) => ProfileScreen(),
    SignUpScreen.name: (context) => SignUpScreen(),
    LoginScreen.name: (context) => LoginScreen(),
    HomeScreen.name: (context) => HomeScreen(),
  };
}
