class CartEntity {
  final int id;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;
  final List<String> toppings;
  final List<String> sides;

  CartEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sides,
  });
}
