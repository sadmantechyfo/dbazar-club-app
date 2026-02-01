import 'package:flutter/material.dart';

import '../../../core/widgets/navigation_shell.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  /// Wallet UI (Top Right)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(
                      onTap: () {
                        // Navigate to wallet page
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 18,
                              color: primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '৳ 1,250',
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Profile content
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150',
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Sadman Techyfo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+880 17XXXXXXXX',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigate to edit profile page
                          },
                          icon: const Icon(Icons.edit, size: 18),
                          label: const Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Menu Section
            _ProfileTile(
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.location_on_outlined,
              title: 'My Address',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),
            _ProfileTile(icon: Icons.language, title: 'Language', onTap: () {}),

            _ProfileTile(
              icon: Icons.local_offer_outlined,
              title: 'Promo Code',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _ProfileTile(
              icon: Icons.logout,
              title: 'Logout',
              isLogout: true,
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = Colors.black;
    final error = theme.colorScheme.error;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: (isLogout ? error : primary).withOpacity(0.1),
          child: Icon(icon, color: isLogout ? error : primary),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isLogout ? error : Colors.black,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
