import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.cartProductList,
    required this.shipping,
  });
  final List<Map<String, dynamic>> cartProductList;
  final double shipping;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: AppColors.black.withAlpha(50), blurRadius: 8),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sub Total"),
                  Text("\$ ${calcSubTotal(cartProductList)}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Shipping"), Text("\$ $shipping")],
              ),
              Divider(color: AppColors.textGrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total"),
                  Text(
                    "\$ ${(calcTotal(shipping, calcSubTotal(cartProductList))).toStringAsFixed(2)}",
                  ),
                ],
              ),
              AppButton(
                onPressed: () {},
                title: "Checkout ->",
                backgroundColor: AppColors.black,
                height: 45,
                textStyle: TextStyles.semiBold_600_12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static double calcSubTotal(List<Map<String, dynamic>> products) {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      final Product product = products[i]["product"];
      total += (product.price * products[i]["quantity"]);
    }
    return total;
  }

  static double calcTotal(double shipping, double total) => shipping + total;
}
