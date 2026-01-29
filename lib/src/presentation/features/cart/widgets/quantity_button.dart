import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key, required this.icon, this.color});
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: color ?? Colors.grey),
    );
  }
}
