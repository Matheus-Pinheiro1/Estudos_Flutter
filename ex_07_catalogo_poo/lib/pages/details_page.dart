import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  color: Colors.black,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildAvatar(),
                const SizedBox(height: 16),
                buildName(),
                const SizedBox(height: 8),
                buildCategory(),
                const SizedBox(height: 16),
                buildPrice(),
                const SizedBox(height: 12),
                buildSaleTag(),
                const SizedBox(height: 20),
                buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAvatar() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: product.isOnSale ? Colors.green : Colors.blueAccent,
      child: const Icon(Icons.shopping_basket, size: 40, color: Colors.white),
    );
  }

  Widget buildName() {
    return Text(
      product.name,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget buildCategory() {
    return Text(
      product.category,
      style: const TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  Widget buildPrice() {
    return Text(
      product.formattedPrice,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: product.isOnSale ? Colors.green : Colors.black,
      ),
    );
  }

  Widget buildSaleTag() {
    if (!product.isOnSale) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Produto está de promoção',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildDescription() {
    return Text(
      product.description,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    );
  }
}
