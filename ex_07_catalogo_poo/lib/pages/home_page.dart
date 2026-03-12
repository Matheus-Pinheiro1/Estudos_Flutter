import 'package:flutter/material.dart';
import '../data/mock_products.dart';
import 'details_page.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 187, 187),
      appBar: AppBar(title: const Text('Catálogo'), centerTitle: true),
      body: buildProductList(context),
    );
  }

  Widget buildProductList(BuildContext context) {
    return ListView.builder(
      itemCount: mockProducts.length,
      itemBuilder: (context, index) {
        final product = mockProducts[index];

        return buildProductItem(context, product);
      },
    );
  }

  Widget buildProductItem(BuildContext context, Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(product: product),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: product.isOnSale ? Colors.green : Colors.blueAccent,
          child: const Icon(Icons.shopping_basket, color: Colors.white),
        ),
        title: Text(product.name),
        subtitle: Text('${product.category} - ${product.formattedPrice}'),
        trailing: product.isOnSale
            ? const Icon(Icons.local_offer, color: Colors.green)
            : const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
