import 'package:benta/Features/Home/data/models/categoty_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:benta/core/utils/api_services.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  final ApiServices api;

  CategoryFilterCubit(this.api) : super(CategoryFilterInitial());

  Future<void> getCategories() async {
    emit(CategoryFilterLoading());
    try {
      final response = await api.get(endPoint: 'categories/get_categories.php');

      final categoriesJson = response['categories'] as List;
      final categories =
          categoriesJson
              .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList();

      emit(CategoryFilterSuccess(categories));
    } catch (e) {
      emit(CategoryFilterFailure(e.toString()));
    }
  }
}
