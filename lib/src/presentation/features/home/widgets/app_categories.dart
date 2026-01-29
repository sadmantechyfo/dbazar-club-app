import 'package:flutter/material.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../core/theme/theme.dart' show BuildContextExtension;
import '../../../core/widgets/category_card.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding.p8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shop By Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        15.verticalSpace,

        SizedBox(
          height: 240,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return const CategoryCard(
                categoryName: 'Vegetables & Fruits',
                categoryImage: 'assets/images/fruits.png',
              );
            },
          ),
        ),
      ],
    );
  }
}
