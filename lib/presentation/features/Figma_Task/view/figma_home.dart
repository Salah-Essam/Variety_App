import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/data/models/product_model.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:variety_app/presentation/features/Figma_Task/widgets/figma_product_card.dart';
import 'package:variety_app/presentation/features/Store/Views/Products/controller/product_list_controller.dart';
import 'package:variety_app/presentation/widgets/app_text_field.dart';

class FigmaHome extends StatefulWidget {
  const FigmaHome({super.key});

  static final String name = "figmaHome";

  @override
  State<FigmaHome> createState() => _FigmaHomeState();
}

class _FigmaHomeState extends State<FigmaHome> {
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

  final TextEditingController searchController = TextEditingController();

  final Widget bagIconBlack = SvgPicture.asset(
    AppAssets.figmaBagBlack,
    height: 32,
    width: 32,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: AppColors.figmaHomeBackGround,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back!", style: TextStyles.regular_400_10),
                      Text("Falcon Thought", style: TextStyles.semiBold_600_12),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: bagIconBlack,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AppTextField(
                controller: searchController,
                onChange: (v) {},
                prefixIcon: const Icon(Icons.search),
                hint: "what are you loking for...",
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.figmaGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shop wit us!",
                                style: TextStyles.regular_400_14,
                              ),

                              Text(
                                "Get 40% Off for all iteams",
                                style: TextStyles.bold_700_20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Shop Now ",
                                      style: TextStyles.bold_700_12,
                                    ),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Image.asset(AppAssets.men)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyles.regular_400_14,
                      ),
                    );
                  },
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children:
                        products.map((product) {
                          return FigmaProductCard(product: product);
                        }).toList(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> categories = [
  "All",
  "Jackets",
  "Jeans",
  "Casual",
  "Shoes",
  "Dress",
  "Blouse",
];
