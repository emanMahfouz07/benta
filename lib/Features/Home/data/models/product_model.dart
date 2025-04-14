class ProductResponse {
  final String status;
  final List<Product> products;

  ProductResponse({required this.status, required this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      products: List<Product>.from(
        json['products'].map((product) => Product.fromJson(product)),
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String categoryName;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryName,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'].trim(),
      description: json['description'].trim(),
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      categoryName: json['category_name'],
      images: List<String>.from(json['images']),
    );
  }
}
