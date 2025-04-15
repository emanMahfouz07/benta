import 'package:benta/Features/Cart/data/models/cart_item.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final ApiServices apiServices;

  CartItemCubit(this.apiServices) : super(CartItemInitial()) {}

  Future<void> getCartItems({required int userId}) async {
    emit(CartItemLoading());
    try {
      final response = await apiServices.get(
        endPoint: 'cart/cart.php?user_id=$userId',
      );
      print("Cart API response: $response");

      if (response['status'] == 'success') {
        final List<CartItem> items = List<CartItem>.from(
          response['cart'].map((item) => CartItem.fromJson(item)),
        );
        emit(CartItemSuccess(items));
      } else {
        final errorMsg = response.data["message"];

        emit(CartItemFailure(errorMsg));
      }
    } catch (e) {
      emit(CartItemFailure('Failed to load cart items'));
    }
  }

  // void removeItem(int itemId) {
  //   final updatedCart = state.where((item) => item.id != itemId).toList();
  //   emit(updatedCart);
  // }
}
