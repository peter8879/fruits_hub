import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';

class OrderProductModel{
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({required this.name, required this.code, required this.imageUrl, required this.price, required this.quantity});
  factory OrderProductModel.formEntity(CartItemEntity entity){
    return OrderProductModel(
      name: entity.product.name,
      code: entity.product.code,
      imageUrl: entity.product.imageUrl!,
      price: entity.product.price.toDouble(),
      quantity: entity.quantity,
    );
  }
  Map<String ,dynamic> toJson(){
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };

  }
}