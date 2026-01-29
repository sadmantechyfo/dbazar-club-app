import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'quantity_button.dart';

/// ---------------- CART ITEM ----------------

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });
  final String image;
  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 70, height: 70),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                        ),
                        const Icon(Icons.close, size: 18, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const QuantityButton(icon: Icons.remove),
                        const SizedBox(width: 12),
                        const Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                         QuantityButton(
                          icon: Icons.add,
                          color: context.color.primary,
                        ),
                        const Spacer(),
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
