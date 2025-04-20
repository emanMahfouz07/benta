import 'package:benta/Features/Home/data/models/product_model.dart';
import 'package:benta/core/Errors/failure.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final ApiServices apiServices;

  AllProductsCubit(this.apiServices) : super(AllProductsInitial());

  Future<void> getAllProducts() async {
    emit(AllProductsLoading());
    try {
      final data = await apiServices.get(endPoint: 'products/get_products.php');
      final response = ProductResponse.fromJson(data);
      emit(AllProductsSuccess(response.products));
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      emit(AllProductsError(failure.errMessage));
    } catch (e) {
      emit(AllProductsError('Unexpected error: ${e.toString()}'));
    }
  }
}
