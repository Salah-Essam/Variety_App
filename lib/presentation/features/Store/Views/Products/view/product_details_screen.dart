import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "ProductDetails";

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id,
              child: Image.network(
                product.image,
                width: size.width,
                height: size.height * 0.45,
              ),
            ),
            SizedBox(height: 24),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "add to cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.shopping_cart_rounded, size: 40),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
