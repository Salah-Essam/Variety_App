import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/app_routes.dart';
import 'package:variety_app/presentation/features/auth/view/login_screen.dart';

void main() {
  runApp(const VarietyApp());
}

class VarietyApp extends StatelessWidget {
  const VarietyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.name,
      routes: AppRoutes.routes,
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
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: const OutlineInputBorder(
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
