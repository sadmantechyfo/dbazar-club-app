part of '../router.dart';

List<GoRoute> _notificationRoutes(Ref ref) {
  return [
    GoRoute(
      path: Routes.notifications,
      name: Routes.notifications,
      pageBuilder: (context, state) {
        return const MaterialPage(child: NotificationPage());
      },
    ),
  ];
}
