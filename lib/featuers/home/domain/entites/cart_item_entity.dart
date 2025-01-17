import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity product;
  int count;

  CartItemEntity({required this.product, this.count=0});
  num calculateTotalPrice(){
    return product.price*count;
  }
  num calculateTotalWeight(){
    return product.unitAmount*count;
  }
  void increaseCount(){
    count++;
  }
  void decreaseCount(){
    if(count>0){
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}