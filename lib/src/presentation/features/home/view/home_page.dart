import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/navigation_shell.dart';
import '../riverpod/home_provider.dart';
import '../widgets/app_banner_slider.dart';
import '../widgets/app_categories.dart';
import '../widgets/app_search_bar.dart';

// ---------------- Home Page ----------------
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(homeCategoryProvider);

    return const Scaffold(
      appBar: HomeAppBar(),
      endDrawer: AppDrawer(),
      body: CustomScrollView(
        slivers: [
          /// SEARCH + BANNER
          SliverToBoxAdapter(
            child: Column(
              children: [
                AppSearchBar(),
                SizedBox(height: 16),
                AppBannerSlider(),
                SizedBox(height: 16),
                ShopByCategory(),
              ],
            ),
          ),

          /// PROMO GRID
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   sliver: _PromoGridSliver(category: category),
          // ),

          SliverToBoxAdapter(child: Gap(24)),

          /// FLASH SALE HEADER
          SliverToBoxAdapter(child: _FlashSaleHeader()),

          SliverToBoxAdapter(child: Gap(12)),

          /// FLASH SALE LIST
          SliverToBoxAdapter(child: _FlashSaleList()),
        ],
      ),
    );
  }
}

// ---------------- Promo Grid ----------------
class _PromoGrid extends ConsumerWidget {
  const _PromoGrid({super.key});

  static const Map<HomeCategory, List<String>> promoData = {
    HomeCategory.grocery: [
      'Winter\nCollection',
      'Flash\nSales',
      'Food',
      'Cleaning\nSupplies',
      'Home &\nKitchen',
      'Fashion &\nLifestyle',
    ],
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(homeCategoryProvider);
    final items = promoData[category] ?? [];

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.6,
      children: items.map((title) => _PromoCard(title: title)).toList(),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //context.go(Routes.categoryProducts);
        context.pushNamed(Routes.categoryProducts, extra: {'title': title});
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }
}

// ---------------- Flash Sale ----------------
class _FlashSaleHeader extends StatelessWidget {
  const _FlashSaleHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Flash Sales', style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: () {
            context.push(Routes.categoryProducts);
          },
          child: const Text('More'),
        ),
      ],
    );
  }
}

class _FlashSaleList extends StatelessWidget {
  const _FlashSaleList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const Gap(12),
        itemBuilder: (context, index) => const _ProductCard(),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Gap(8),
          const Text(
            'Foodela Atta',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(4),
          const Text('৳119', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
