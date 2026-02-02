import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/app_localization.dart';
import '../../features/authentication/login/widgets/language_switcher.dart';
import '../../features/search/views/search_page.dart';
import '../router/routes.dart';
import '../theme/theme.dart';
import 'text/typography.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int _cartCount = 2;
  int _totalPrice = 6124;

  void _onCheckoutPressed() {
    print('Checkout pressed');
    context.pushNamed(Routes.cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.statefulNavigationShell,
      bottomNavigationBar: _CustomBottomNavBar(
        currentIndex: widget.statefulNavigationShell.currentIndex,
        onTap: widget.statefulNavigationShell.goBranch,
      ),
    );
  }
}

// Custom Bottom Navigation Bar matching Image 1
class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: context.locale.home,
                isActive: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavBarItem(
                icon: Icons.grid_view_outlined,
                activeIcon: Icons.grid_view,
                label: context.locale.categories,
                isActive: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavBarItem(
                icon: Icons.shopping_cart_outlined,
                activeIcon: Icons.shopping_cart,
                label: context.locale.cart,
                isActive: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavBarItem(
                icon: Icons.person_2_outlined,
                activeIcon: Icons.person_2,
                label: context.locale.profile,
                isActive: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Individual Nav Bar Item
class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? context.color.primary : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? context.color.primary : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // Checkout Bar matching Image 2
// class _CheckoutBar extends StatelessWidget {
//   const _CheckoutBar({
//     required this.cartCount,
//     required this.totalPrice,
//     required this.onCheckoutPressed,
//   });
//   final int cartCount;
//   final int totalPrice;
//   final VoidCallback onCheckoutPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Theme.of(context).colorScheme.primary;
//
//     return Container(
//       height: 50,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: primaryColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: primaryColor.withOpacity(0.35),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onCheckoutPressed,
//           borderRadius: BorderRadius.circular(16),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 /// Checkout text
//                 Text(
//                   'Checkout',
//                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//
//                 const Spacer(),
//
//                 /// Total price
//                 Text(
//                   '৳$totalPrice',
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(context.locale.profile), centerTitle: true);
  }
}

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Flutter '));
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Language Switch
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LanguageSwitcherWidget(),
            ),

            const SizedBox(height: 20),

            // Login
            ListTile(
              leading: const Icon(Icons.person, color: Colors.purple),
              title: const Text('Login'),
              onTap: () {},
            ),

            const Divider(),

            // Menu Items with Icons
            ListTile(
              leading: const Icon(Icons.store, color: Colors.blue),
              title: const Text('All Stores'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.red),
              title: const Text('Offers'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.orange),
              title: const Text('Premium Care'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.green),
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.teal),
              title: const Text('Customer Support'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.security, color: Colors.indigo),
              title: const Text('Safety Center'),
              onTap: () {},
            ),

            const Spacer(),

            // Footer
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  FlutterLogo(size: 24),
                  SizedBox(width: 8),
                  Text(
                    'dBazarClub',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('v1.0.1', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
