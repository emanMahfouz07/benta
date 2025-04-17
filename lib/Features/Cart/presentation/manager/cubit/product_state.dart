part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccesss extends ProductState {
  final Product productList;
  ProductSuccesss(this.productList);
}

final class ProductFailure extends ProductState {
  final String error;
  ProductFailure(this.error);
}
