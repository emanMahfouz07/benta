import 'package:benta/Features/Home/data/models/item_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseurl = 'https://zbooma.com/furniture_api/';
  final _baseurlFake = 'https://fakestoreapi.com/products';
  final Dio dio;

  ApiServices(this.dio);
  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseurlFake$endPoint');
    return response.data;
  }

  Future<Response> post({required body, required String endPoint}) async {
    var response = await dio.post('$_baseurl$endPoint', data: body);
    return response;
  }

  Future<List<ItemModel>> getItemsByCategory(String category) async {
    try {
      final response = await dio.get('$_baseurlFake/category/$category');
      print('API Response: ${response.data}');
      List<ItemModel> items =
          (response.data as List)
              .map((item) => ItemModel.fromJson(item))
              .toList();
      return items;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products');
    }
  }
}
