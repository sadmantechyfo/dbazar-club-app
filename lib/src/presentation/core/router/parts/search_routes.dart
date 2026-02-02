part of '../router.dart';

List<GoRoute> _searchRoutes(Ref ref) {
  return [
    GoRoute(
      path: Routes.search,
      name: Routes.search,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const MaterialPage(child: SearchPage());
      },
    ),
  ];
}
