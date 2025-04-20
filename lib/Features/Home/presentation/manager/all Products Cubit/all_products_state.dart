part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsSuccess extends AllProductsState {
  final List<Product> products;

  AllProductsSuccess(this.products);
}

class AllProductsError extends AllProductsState {
  final String message;

  AllProductsError(this.message);
}
