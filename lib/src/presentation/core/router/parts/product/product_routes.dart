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
          child: CategoryProductList(title: data?['title'] ?? 'Products'),
        );
      },
    ),

    GoRoute(
      path: Routes.cart,
      name: Routes.cart,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: CartPage(),
        );
      },
    ),
  ];
}
