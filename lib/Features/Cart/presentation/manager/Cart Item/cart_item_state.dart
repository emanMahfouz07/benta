part of 'cart_item_cubit.dart';

@immutable
sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemLoading extends CartItemState {}

final class CartItemSuccess extends CartItemState {
  final List<CartItem> cartItems;

  CartItemSuccess(this.cartItems);
}

final class CartItemFailure extends CartItemState {
  final String message;

  CartItemFailure(this.message);
}
