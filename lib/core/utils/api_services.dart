import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ApiServices {
  final _baseurl = 'https://zbooma.com/furniture_api/';
  final Dio dio;

  ApiServices(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseurl$endPoint');
    return response.data;
  }

  Future<Response> post({required body, required String endPoint}) async {
    var response = await dio.post('$_baseurl$endPoint', data: body);
    return response;
  }
}
