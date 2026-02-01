import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Categories')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding.p8),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return  CategoryCard(
              categoryName: 'Vegetables & Fruits',
              categoryImage: 'assets/images/fruits.png',
              onTap: () {
                context.pushNamed(Routes.categoryDetails,);
              },
            );
          },
        ),
      ),
    );
  }
}
