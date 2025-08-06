import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/controller/product_list_controller.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const name = "ProductsScreen";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final Productlistcontroller productlistcontroller = Productlistcontroller();
  bool isLoading = true;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await productlistcontroller.getProducts();
    setState(() {
      products = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      "Products",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    iconTheme: IconThemeData(color: AppColors.black),
                    floating: true,
                    pinned: false,
                    expandedHeight: size.height * 0.25,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                        tag: AppAssets.products,
                        child: Image.asset(
                          AppAssets.products,
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ProductCard(product: products[index]);
                    }, childCount: products.length),
                  ),
                ],
              ),
    );
  }
}
