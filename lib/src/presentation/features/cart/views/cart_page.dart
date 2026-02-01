import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../widgets/cart_item.dart';
import '../widgets/checkout_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyActions : false,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
      ),
      body: Column(
        children: [
          /// CART LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartItem(
                  image: "assets/images/egg.png",
                  title: "Bell Pepper Red",
                  subtitle: "1kg, Price",
                  price: "\$4.99",
                );
              },
            ),
          ),

          CheckoutButton(
            price: 12.56,
            isLoading: false,
            isDisabled: false,
            onPressed: () {
              context.push(Routes.checkout);
            },
          )

        ],
      ),
    );
  }
}




