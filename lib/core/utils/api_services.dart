import 'package:dio/dio.dart';

class ApiServices {
  final _baseurl = 'https://zbooma.com/furniture_api';
  final Dio dio;

  ApiServices(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseurl$endPoint');
    return response.data;
  }
}
