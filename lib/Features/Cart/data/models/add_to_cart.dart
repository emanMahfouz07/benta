class AddToCartModel {
  final int userId;
  final int productId;
  final int quantity;

  AddToCartModel({
    required this.userId,
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'product_id': productId, 'quantity': quantity};
  }

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }
}
