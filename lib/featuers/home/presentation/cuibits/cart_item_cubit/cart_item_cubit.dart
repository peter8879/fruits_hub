import 'package:bloc/bloc.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(ItemUpdated(cartItemEntity));
  }
}
