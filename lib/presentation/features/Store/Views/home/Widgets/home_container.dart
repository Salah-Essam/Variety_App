// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    this.child,
    required this.title,
    required this.onTap,
  });
  final Widget? child;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(150),
              blurRadius: 16,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    child ??
                    Image.asset(
                      AppAssets.imageNotFound,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
