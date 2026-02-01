import 'package:flutter/material.dart';

import '../../../core/widgets/category_card.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});
  final hasSubCategories = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('category.name')),
      body: hasSubCategories
          ? const _SubCategoryGrid(subCategories: [
            1,2
      ])
          : const _ProductList(categoryId: '1'),
    );
  }
}

class _SubCategoryGrid extends StatelessWidget {
  const _SubCategoryGrid({required this.subCategories});
  final List subCategories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: subCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryName: 'sub.name',
            categoryImage: 'sub.image',
            onTap: () {
              // context.pushNamed(
              //   Routes.categoryProducts,
              //   extra: sub.id,
              // );
            },
          );
        },
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Products for category $categoryId'));
  }
}
