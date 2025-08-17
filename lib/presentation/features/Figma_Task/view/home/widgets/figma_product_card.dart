import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/view/product_details_screen.dart';

class FigmaProductCard extends StatelessWidget {
  FigmaProductCard({super.key, required this.product});
  final Product product;

  final Widget bagIconWhite = SvgPicture.asset(
    AppAssets.figmaBagWhite,
    height: 32,
    width: 32,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: product,
        );
      },
      child: SizedBox(
        width: (size.width >= 450) ? 200 : 150,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.figmaLightGrey,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: product.id,
                            child: Image.network(
                              product.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: SizedBox(
                            width: 35,
                            height: 35,
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: const Icon(
                                Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: AppColors.black,
                            child: bagIconWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.regular_400_14,
                  ),
                ),
              ),
              Text("\$ ${product.price}", style: TextStyles.bold_700_12),
            ],
          ),
        ),
      ),
    );
  }
}
