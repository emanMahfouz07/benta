part of 'get_item_cubit.dart';

@immutable
sealed class GetItemState {}

final class GetItemInitial extends GetItemState {}

final class GetItemLoading extends GetItemState {}

final class GetItemSuccess extends GetItemState {
  final List<Product> items;

  GetItemSuccess(this.items);
}

final class GetItemFailure extends GetItemState {
  final String errorMessage;

  GetItemFailure(this.errorMessage);
}
