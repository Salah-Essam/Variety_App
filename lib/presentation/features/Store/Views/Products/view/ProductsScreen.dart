import 'package:flutter/material.dart';
import 'package:variety_app/core/AppAssets.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const name = "ProductsScreen";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final product = products[0];
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: AppAssets.products,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AppAssets.products,
                  fit: BoxFit.cover,
                  height: size.height * 0.25,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
