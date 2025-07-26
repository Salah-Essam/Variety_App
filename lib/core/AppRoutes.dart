import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/features/Home/view/ProfileScreen.dart';
import 'package:variety_app/presentation/features/auth/view/LoginScreen.dart';
import 'package:variety_app/presentation/features/auth/view/SignUpScreen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    ProfileScreen.name: (context) => ProfileScreen(),
    SignUpScreen.name: (context) => SignUpScreen(),
    LoginScreen.name: (context) => LoginScreen(),
    HomeScreen.name: (context) => HomeScreen(),
  };
}
