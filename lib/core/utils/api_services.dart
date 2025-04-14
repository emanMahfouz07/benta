import 'package:benta/Features/Home/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://zbooma.com/furniture_api/';
  final Dio dio;

  ApiServices(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Response> post({
    required dynamic body,
    required String endPoint,
  }) async {
    var response = await dio.post('$_baseUrl$endPoint', data: body);
    return response;
  }

  Future<List<Product>> getItemsByCategory(String categoryName) async {
    try {
      final response = await dio.get('${_baseUrl}products/get_products.php');
      print('API Response: ${response.data}');

      final data = response.data;

      if (data['status'] == 'success') {
        List<Product> allProducts = List<Product>.from(
          data['products'].map((item) => Product.fromJson(item)),
        );
        List<Product> filtered =
            allProducts
                .where((item) => item.categoryName == categoryName)
                .toList();

        return filtered;
      } else {
        throw Exception('Failed: ${data['status']}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteCartItem({
    required int userId,
    required int cartItemId,
  }) async {
    try {
      final response = await dio.delete(
        '${_baseUrl}cart/cart.php?user_id=$userId',
        queryParameters: {'user_id': userId, 'cart_item_id': cartItemId},
      );

      print('API Response: ${response.data}'); // Log the response

      if (response.data['status'] != 'success') {
        throw Exception('Failed to delete item');
      }
    } catch (e) {
      print('Delete error: $e');
      throw Exception('Failed to delete item');
    }
  }
}
