import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit of(context) => BlocProvider.of<CartCubit>(context);
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addToCart(ProductEntity productEntity) {
    if(cartEntity.isProductInCart(productEntity.code)){
     cartEntity.increaseProductCount(productEntity.code);
    }
    else
      {
        cartEntity.addCartItem(CartItemEntity(product: productEntity,count: 1));
      }
    emit(CartItemAdded());
  }
  void removeFromCart(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
