import 'package:flutter/material.dart';
import 'package:variety_app/core/AppColors.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/features/Home/view/ProfileScreen.dart';
import 'package:variety_app/presentation/features/auth/view/LoginScreen.dart';
import 'package:variety_app/presentation/features/auth/view/SignUpScreen.dart';

void main() {
  runApp(VarietyApp());
}

class VarietyApp extends StatelessWidget {
  const VarietyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.name,
      routes: {
        ProfileScreen.name: (context) => ProfileScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        LoginScreen.name: (context) => LoginScreen(),
        HomeScreen.name: (context) => HomeScreen(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.red),
          ),
          suffixIconColor: Colors.grey,
          prefixIconColor: Colors.grey,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          onPrimary: AppColors.white,
        ),

        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}
