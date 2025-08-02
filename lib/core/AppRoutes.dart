import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/features/Home/view/ProfileScreen.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/ProductsScreen.dart';
import 'package:variety_app/presentation/features/Store/Views/home/view/Store_HomeScreen.dart';
import 'package:variety_app/presentation/features/auth/view/LoginScreen.dart';
import 'package:variety_app/presentation/features/auth/view/SignUpScreen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    ProductsScreen.name: (context) => ProductsScreen(),
    StoreHomeScreen.name: (context) => StoreHomeScreen(),
    ProfileScreen.name: (context) => ProfileScreen(),
    SignUpScreen.name: (context) => SignUpScreen(),
    LoginScreen.name: (context) => LoginScreen(),
    HomeScreen.name: (context) => HomeScreen(),
  };
}
