import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/app_routes.dart';
import 'package:variety_app/core/managers/shared_preferences_manager.dart';
import 'package:variety_app/data/models/cart_model.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/firebase_options.dart';
import 'package:variety_app/presentation/features/Home/view/home_screen.dart';
import 'package:variety_app/presentation/features/auth/view/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    SharedPreferencesManager.init(),
    Hive.initFlutter(),
  ]);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartModelAdapter());
  runApp(const VarietyApp());
}

class VarietyApp extends StatelessWidget {
  const VarietyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String? token = SharedPreferencesManager.getToken();
    return MaterialApp(
      initialRoute: token != null ? HomeScreen.name : LoginScreen.name,
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
