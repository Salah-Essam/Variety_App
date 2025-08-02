import 'package:flutter/material.dart';
import 'package:variety_app/core/AppAssets.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/ProductsScreen.dart';
import 'package:variety_app/presentation/features/Store/Widgets/homeContainer.dart';

class StoreHomeScreen extends StatelessWidget {
  const StoreHomeScreen({super.key});

  static const String name = "StoreHomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Store App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            homeContainer(
              title: "Products",
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
            SizedBox(height: 24),
            homeContainer(
              title: "Cart",
              onTap: () {},
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
