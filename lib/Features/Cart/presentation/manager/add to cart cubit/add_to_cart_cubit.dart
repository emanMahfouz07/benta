import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.apiServices) : super(AddToCartInitial());

  final ApiServices apiServices;

  Future<void> addToCart(AddToCartModel cartItem) async {
    emit(AddToCartLoading());

    try {
      final response = await apiServices.post(
        body: cartItem.toJson(),
        endPoint: 'cart/cart.php',
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        emit(AddToCartSuccess());
      } else {
        emit(
          AddToCartFailure(response.data['message'] ?? "Failed to add to cart"),
        );
      }
    } catch (e) {
      emit(AddToCartFailure("Something went wrong"));
    }
  }
}
