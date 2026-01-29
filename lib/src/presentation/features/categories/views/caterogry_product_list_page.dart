import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/theme.dart';
import 'product_details_page.dart';

class CategoryProductList extends StatelessWidget {
  const CategoryProductList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final products = [
      ProductItem(
        title: 'Chicken Eggs (Discounted)',
        subtitle: '12 pcs',
        price: 109,
        oldPrice: 119,
        delivery: '1 hr',
        imageUrl: 'assets/eggs.png',
      ),
      ProductItem(
        title: 'Tata Tea Premium',
        subtitle: '400 gm',
        price: 149,
        oldPrice: 220,
        delivery: '1 hr',
        imageUrl: 'assets/tata_tea.png',
      ),
      ProductItem(
        title: 'Ching\'s Red Chilli Sauce',
        subtitle: '200 gm',
        price: 99,
        oldPrice: 160,
        delivery: '1 hr',
        imageUrl: 'assets/chilli_sauce.png',
      ),
      ProductItem(
        title: 'Desifarm Khejurer Patali Gur Giftbox',
        subtitle: '1 kg',
        price: 599,
        oldPrice: 700,
        delivery: '1 hr',
        imageUrl: 'assets/patali_gur.png',
      ),
      ProductItem(
        title: 'Root Premium Akher Gur (Pow...',
        subtitle: '400 gm',
        price: 309,
        oldPrice: 320,
        delivery: '1 hr',
        imageUrl: 'assets/akher_gur.png',
      ),
      ProductItem(
        title: 'Desifarm Khejurer Nolen Gur',
        subtitle: '1 kg',
        price: 619,
        oldPrice: 660,
        delivery: '1 hr',
        imageUrl: 'assets/nolen_gur.png',
      ),
      ProductItem(
        title: 'Broccoli',
        subtitle: 'each',
        price: 65,
        oldPrice: 85,
        delivery: '1 hr',
        imageUrl: 'assets/broccoli.png',
      ),
      ProductItem(
        title: 'Desifarm Khejurer Danadar Jhola Gur',
        subtitle: '1 kg',
        price: 619,
        oldPrice: 650,
        delivery: '1 hr',
        imageUrl: 'assets/jhola_gur.png',
      ),
      ProductItem(
        title: 'Vaseline Lip Therapy Original',
        subtitle: '20 gm',
        price: 300,
        oldPrice: null,
        delivery: '1 hr',
        imageUrl: 'assets/vaseline.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            //context.go(Routes.home);
            context.pop();
          },
        ),
        title: Text(
          title.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive column count
          int crossAxisCount = 3; // Default for mobile
          if (constraints.maxWidth > 1200) {
            crossAxisCount = 6;
          } else if (constraints.maxWidth > 900) {
            crossAxisCount = 5;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 4;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ProductGridCard(
                product: products[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ProductItem {
  ProductItem({
    required this.title,
    required this.subtitle,
    required this.price,
    this.oldPrice,
    required this.delivery,
    required this.imageUrl,
  });
  final String title;
  final String subtitle;
  final int price;
  final int? oldPrice;
  final String delivery;
  final String imageUrl;
}

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({
    super.key,
    required this.product,
    required this.onTap,
  });
  final ProductItem product;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 50,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  // Add button on image
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: context.color.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Price Row
                        Row(
                          children: [
                            Text(
                              '৳${product.price}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF3B5C),
                              ),
                            ),
                            if (product.oldPrice != null) ...[
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  '৳${product.oldPrice}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),

                        // Product Title
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // Subtitle and Delivery
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product.subtitle,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 11,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              product.delivery,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
