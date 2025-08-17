import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_strings.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/cart/view/figma_carts.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/products_screen.dart';
import 'package:variety_app/presentation/features/Store/Views/home/Widgets/home_container.dart';

class StoreHomeScreen extends StatelessWidget {
  const StoreHomeScreen({super.key});

  static const String name = "StoreHomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.storeApp)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HomeContainer(
              title: AppStrings.products,
              onTap: () {
                Navigator.pushNamed(context, ProductsScreen.name);
              },
              child: Hero(
                tag: AppAssets.products,
                child: Image.asset(
                  AppAssets.products,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 24),
            HomeContainer(
              title: AppStrings.cart,
              onTap: () {
                Navigator.pushNamed(context, FigmaCarts.name);
              },
              child: Image.asset(
                AppAssets.cart,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
