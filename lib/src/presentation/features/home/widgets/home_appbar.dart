import 'package:flutter/material.dart';

import '../../../../core/extensions/spacing.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String selectedLocation = 'Home';
  final locations = ['Home', 'Office', 'Mirpur-1, DhakaMirpur-1, Dhaka'];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: PopupMenuButton<String>(
        onSelected: (value) {
          setState(() {
            selectedLocation = value;
          });
        },
        itemBuilder: (context) {
          return locations
              .map((loc) => PopupMenuItem<String>(value: loc, child: Text(loc)))
              .toList();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_on),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Our Shop",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                2.verticalSpace,
                Row(
                  children: [
                    Text(
                      selectedLocation,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
