part of 'cart_item_cubit.dart';

@immutable
sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}
final class ItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;
  ItemUpdated(this.cartItemEntity);
}
