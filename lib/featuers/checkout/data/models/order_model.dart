import 'package:fruits_hub/featuers/checkout/data/models/order_product__model.dart';
import 'package:fruits_hub/featuers/checkout/data/models/shiping_address_model.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';

class OrderModel
{
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> products;
  final String paymentMethod;

  OrderModel({required this.totalPrice, required this.uID, required this.shippingAddress, required this.products, required this.paymentMethod});
  Map<String,dynamic>toJson(){
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'shippingAddress': shippingAddress.toJson(),
      'products': products.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
  factory OrderModel.fromEntity(OrderEntity orderEntity){
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uID: orderEntity.uID,
      shippingAddress: ShippingAddressModel.fromEntity(orderEntity.shippingAddress),
      products: orderEntity.cartEntity.cartItems.map((e) => OrderProductModel.formEntity(e)).toList(),
      paymentMethod: orderEntity.payWithCash==true?'Cash':'PayPal',
    );
  }

}