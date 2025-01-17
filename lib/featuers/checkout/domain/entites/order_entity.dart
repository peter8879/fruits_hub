import 'package:fruits_hub/featuers/checkout/domain/entites/shiping_address_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';

class OrderEntity{
  final CartEntity cartEntity;
   bool? payWithCash;
   ShippingAddressEntity shippingAddress;

  OrderEntity({required this.cartEntity,  this.payWithCash,required this.shippingAddress});



}