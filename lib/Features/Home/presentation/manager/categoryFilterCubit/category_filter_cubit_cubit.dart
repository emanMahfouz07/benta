import 'package:benta/Features/Home/data/models/categoty_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:benta/core/utils/api_services.dart';

part 'category_filter_cubit_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  final ApiServices api;

  CategoryFilterCubit(this.api) : super(CategoryFilterInitial());

  Future<void> getCategories() async {
    emit(CategoryFilterLoading());
    try {
      final response = await api.get(endPoint: 'categories');
      final List data = response as List;
      final categories = data.map((e) => CategoryModel.fromJson(e)).toList();
      emit(CategoryFilterSuccess(categories));
    } catch (e) {
      emit(CategoryFilterFailure(e.toString()));
    }
  }
}
