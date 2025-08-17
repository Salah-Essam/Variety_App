import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/product_details_screen.dart';

class ProductCardInCart extends StatelessWidget {
  const ProductCardInCart({
    super.key,
    required this.product,
    required this.size,
    required this.quantity,
  });

  final Product product;
  final Size size;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetailsScreen.name,
            arguments: product,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.black.withAlpha(25), blurRadius: 8),
            ],
          ),
          height: 125,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.contain,
                    width: 75,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.45,
                      child: Text(
                        product.title,
                        style: TextStyles.regular_400_10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: TextStyles.semiBold_600_12,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.figmaIconGrey,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(quantity.toString()),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.remove_circle_outline_rounded,
                                color: AppColors.figmaIconGrey,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Size"),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.delete_outlined,
                        color: AppColors.darkRed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
