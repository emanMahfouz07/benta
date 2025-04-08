import 'package:benta/Features/Home/data/models/item_model.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_item_state.dart';

class GetItemCubit extends Cubit<GetItemState> {
  final ApiServices apiServices;

  GetItemCubit(this.apiServices) : super(GetItemInitial());

  Future<void> getItemsByCategory(String category) async {
    try {
      emit(GetItemLoading());
      final response = await apiServices.getItemsByCategory(category);

      emit(GetItemSuccess(response));
    } catch (e) {
      emit(GetItemFailure(e.toString()));
    }
  }
}
