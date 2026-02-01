import 'package:flutter/material.dart';

import '../../../core/extensions/spacing.dart';
import '../theme/theme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
  });

  final String categoryName;
  final String categoryImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(categoryImage, fit: BoxFit.cover),
          ),
          6.verticalSpace,
          Text(
            categoryName,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: context.textStyle.bodyMedium.copyWith(
              overflow: TextOverflow.ellipsis,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
