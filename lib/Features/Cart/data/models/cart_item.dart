class CartItem {
  final int id;
  final int quantity;
  final String name;
  final String price;

  CartItem({
    required this.id,
    required this.quantity,
    required this.name,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'quantity': quantity, 'name': name, 'price': price};
  }
}
