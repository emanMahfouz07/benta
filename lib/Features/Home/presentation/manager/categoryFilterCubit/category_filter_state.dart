part of 'category_filter_cubit.dart';

@immutable
sealed class CategoryFilterState {}

class CategoryFilterInitial extends CategoryFilterState {}

class CategoryFilterLoading extends CategoryFilterState {}

class CategoryFilterSuccess extends CategoryFilterState {
  final List<CategoryModel> categories;

  CategoryFilterSuccess(this.categories);
}

class CategoryFilterFailure extends CategoryFilterState {
  final String error;

  CategoryFilterFailure(this.error);
}
