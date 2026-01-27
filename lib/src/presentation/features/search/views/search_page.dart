import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            height: 45,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search products, categories...',
                prefixIcon: Icon(Icons.search, color: context.color.primary),
                filled: true,
                fillColor: context.color.primary.withOpacity(
                  0.08,
                ), // subtle tint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: context.color.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: context.color.primary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Recent Searches',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Milk')),
              Chip(label: Text('Eggs')),
              Chip(label: Text('Rice')),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Popular Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 3,
            children: const [
              Card(child: Center(child: Text('Fruits'))),
              Card(child: Center(child: Text('Vegetables'))),
              Card(child: Center(child: Text('Snacks'))),
              Card(child: Center(child: Text('Beverages'))),
            ],
          ),
        ],
      ),
    );
  }
}
