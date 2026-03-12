class Product {
  final String name;
  final double price;
  final String category;
  final String description;
  final bool isOnSale;

  const Product({
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.isOnSale,
  });

  String get formattedPrice {
    return 'R\$ ${price.toStringAsFixed(2)}';
  }

  String get saleLabel {
    return isOnSale ? 'Em promoção' : 'Preço normal';
  }
}
