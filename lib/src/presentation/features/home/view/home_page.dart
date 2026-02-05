import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/navigation_shell.dart';
import '../../categories/views/product_list_page.dart';
import '../../categories/views/product_details_page.dart';
import '../riverpod/home_provider.dart';
import '../widgets/app_banner_slider.dart';
import '../widgets/app_categories.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/home_appbar.dart';

// ---------------- Home Page ----------------
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(homeCategoryProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
      endDrawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                8.verticalSpace,
                AppSearchBar(
                  onTap: () {
                    context.pushNamed(Routes.search);
                  },
                ),
                const SizedBox(height: 16),
                const AppBannerSlider(),
                const SizedBox(height: 16),
                const ShopByCategory(),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: Gap(24)),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _FlashSaleHeader(),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductGridCard(
                  product: products[index],
                  onTap: () {
                    context.pushNamed(
                      Routes.productDetails,
                      // extra: products[index],
                    );
                  },
                );
              }, childCount: products.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
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
