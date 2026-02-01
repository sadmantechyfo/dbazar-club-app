part of '../../router.dart';

List<GoRoute> _productRoutes(Ref ref) {
  return [
    GoRoute(
      path: Routes.categoryProducts,
      name: Routes.categoryProducts,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        return MaterialPage(
          child: ProductListPage(title: data?['title'] ?? 'Products'),
        );
      },
    ),
    GoRoute(
      name: Routes.categoryDetails,
      path: Routes.categoryDetails,
      builder: (context, state) {
        //final category = state.extra as Category;
        return const CategoryDetailsPage();
      },
    ),

    GoRoute(
      path: Routes.cart,
      name: Routes.cart,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const MaterialPage(child: CartPage());
      },
    ),

    GoRoute(
      path: Routes.checkout,
      name: Routes.checkout,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const MaterialPage(child: CheckoutPage());
      },
    ),

    GoRoute(
      path: Routes.productDetails,
      name: Routes.productDetails,
      builder: (context, state) {
        //final product = state.extra as Product;
        return const ProductDetailsPage();
      },
    ),
  ];
}
