import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key,required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.p8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: context.color.inactive,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 25, color: context.color.icon),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Search Store',
                  style: TextStyle(
                    fontSize: 14,
                    color: context.color.text.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
