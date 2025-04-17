import 'package:benta/Features/Home/data/models/product_model.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.apiServices) : super(ProductInitial());

  final ApiServices apiServices;

  Future<void> fetchProductInfo(String id) async {
    emit(ProductLoading());
    try {
      final product = await apiServices.getProductById(id);
      emit(ProductSuccesss(product));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
