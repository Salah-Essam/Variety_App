import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/presentation/features/Figma_Task/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:variety_app/presentation/widgets/app_text_field.dart';

class FigmaHome extends StatefulWidget {
  const FigmaHome({super.key});

  static final String name = "figmaHome";

  @override
  State<FigmaHome> createState() => _FigmaHomeState();
}

class _FigmaHomeState extends State<FigmaHome> {
  final TextEditingController searchController = TextEditingController();

  final Widget bagIcon = SvgPicture.asset(
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
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back!", style: TextStyles.regular_400_10),
                    Text("Falcon Thought", style: TextStyles.semiBold_600_12),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: bagIcon,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            AppTextField(
              controller: searchController,
              onChange: (v) {},
              prefixIcon: Icon(Icons.search),
              hint: "what are you loking for...",
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: AppColors.figmaGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop wit us!",
                            style: TextStyles.regular_400_14,
                          ),
                          SizedBox(height: 16),

                          Text(
                            "Get 40% Off for all iteams",
                            style: TextStyles.bold_700_20,
                          ),
                          SizedBox(height: 24),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  "Shop Now ",
                                  style: TextStyles.bold_700_12,
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Image.asset(AppAssets.men)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
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
          ],
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
