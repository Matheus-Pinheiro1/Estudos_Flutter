import 'package:flutter/material.dart';
import '../data/mock_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: ListView.builder(
        itemCount: mockProducts.length,
        itemBuilder: (context, index) {
          final product = mockProducts[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: product.isOnSale ? Colors.green : Colors.blueAccent,
                child: const Icon(Icons.shopping_basket, color: Colors.white),
              ),
              title: Text(product.name),
              subtitle: Text('${product.category} - ${product.formattedPrice}'),
              trailing: product.isOnSale ? const Icon(Icons.local_offer, color: Colors.green,) : const Icon(Icons.arrow_forward_ios)
            ),
          );
        },
      ),
    );
  }
}
