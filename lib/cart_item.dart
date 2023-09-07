class CartItem {
  final String name;
  final double price;
  final double discountedPrice;
  final String imagePath;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.imagePath,
    this.quantity = 1,
  });
}
