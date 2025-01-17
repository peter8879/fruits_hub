import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';

class CartEntity{
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});
  void addCartItem(CartItemEntity cartItemEntity){
    cartItems.add(cartItemEntity);
  }
  void removeCartItem(CartItemEntity cartItemEntity){
    cartItems.remove(cartItemEntity);
  }
  bool isProductInCart(String productId){
    return cartItems.any((element) => element.product.code==productId);
  }
  void increaseProductCount(String productId){
    cartItems.firstWhere((element) => element.product.code==productId).increaseCount();
  }
  double calculateTotalPrice(){
    double totalPrice=0;
    cartItems.forEach((element){
      totalPrice+=element.calculateTotalPrice();
    });
    return totalPrice;
  }
}