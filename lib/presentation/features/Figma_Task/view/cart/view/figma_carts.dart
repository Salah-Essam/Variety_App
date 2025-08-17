import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/cart_model.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:variety_app/presentation/features/Figma_Task/controller/cart_controller.dart';
import 'package:variety_app/presentation/features/Figma_Task/view/cart/widgets/cart_card.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/controller/product_list_controller.dart';

class FigmaCarts extends StatefulWidget {
  const FigmaCarts({super.key});

  static const String name = "figmaCart";

  @override
  State<FigmaCarts> createState() => _FigmaCartsState();
}

class _FigmaCartsState extends State<FigmaCarts> {
  final CartController cartController = CartController();
  final ProductsController productlistcontroller = ProductsController();

  bool isCartDataLoading = true;
  bool isProductsDataLoading = true;
  bool noCarts = false;
  bool noProducts = false;

  List<CartModel> carts = [];
  List<Product> products = [];

  Future<void> loadCartData() async {
    final cartsBox = await Hive.openBox<CartModel>("carts");

    try {
      final List<CartModel> results = await cartController.getCarts();
      setState(() {
        carts = results;
        isCartDataLoading = false;
      });
      await cartsBox.clear();
      await cartsBox.addAll(results);
    } catch (e) {
      final cachedCarts = cartsBox.values.toList();
      if (cachedCarts.isNotEmpty) {
        setState(() {
          carts = cachedCarts;
          isCartDataLoading = false;
        });
      } else {
        debugPrint("Error fetching carts: $e");
        setState(() {
          noCarts = true;
        });
      }
    }
  }

  Future<void> loadProductsData() async {
    final productsBox = await Hive.openBox<Product>("products");

    try {
      final results = await productlistcontroller.getProducts();

      setState(() {
        products = results;
        isProductsDataLoading = false;
      });
      await productsBox.clear();
      await productsBox.addAll(results);
    } catch (e) {
      final cachedProducts = productsBox.values.toList();
      if (cachedProducts.isNotEmpty) {
        setState(() {
          products = cachedProducts;
          isProductsDataLoading = false;
        });
      } else {
        debugPrint("Error fetching products: $e");
        setState(() {
          noProducts = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadCartData();
    loadProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.figmaHomeBackGround,
      appBar: AppBar(
        title: Text("Carts", style: TextStyles.semiBold_600_16),
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
      ),
      body:
          (noCarts)
              ? const Center(child: Text("No carts available"))
              : (isCartDataLoading || isProductsDataLoading)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: carts.length,

                      itemBuilder: (context, index) {
                        final cart = carts[index];
                        return CartCard(cart: cart, products: products);
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
