import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, this.quantity=0});
  num calculateTotalPrice(){
    return product.price*quantity;
  }
  num calculateTotalWeight(){
    return product.unitAmount*quantity;
  }
  void increaseQuantity(){
    quantity++;
  }
  void decreaseQuantity(){
    if(quantity>0){
      quantity--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}