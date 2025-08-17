import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/cart_model.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/cart/widgets/cart_summary.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/cart/widgets/product_card_in_cart.dart';

class FigmaCartDetails extends StatelessWidget {
  const FigmaCartDetails({super.key});
  static const String name = "figmaCartDetails";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
    final CartModel cart = data["cart"];
    final List<Product> products = data["products"];
    final List<Map<String, dynamic>> cartProductList =
        cart.products.map((cartItem) {
          final product = products.firstWhere(
            (p) => p.id == cartItem.productId,
          );
          return {'product': product, 'quantity': cartItem.quantity};
        }).toList();
    final double shipping = 15.9;

    return Scaffold(
      backgroundColor: AppColors.figmaHomeBackGround,
      appBar: AppBar(
        title: Text(
          "Cart #${cart.id} (User${cart.userId})",
          style: TextStyles.semiBold_600_16,
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cartProductList.length,
          itemBuilder: (context, index) {
            final item = cartProductList[index];
            final product = item['product'] as Product;
            final quantity = item['quantity'] as int;

            return ProductCardInCart(
              product: product,
              size: size,
              quantity: quantity,
            );
          },
        ),
      ),
      bottomNavigationBar: CartSummary(
        shipping: shipping,
        cartProductList: cartProductList,
      ),
    );
  }
}
