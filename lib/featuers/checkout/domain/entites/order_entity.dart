import 'package:fruits_hub/featuers/checkout/domain/entites/shiping_address_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';

class OrderEntity{
  final String uID;
  final CartEntity cartEntity;
   bool? payWithCash;
   ShippingAddressEntity shippingAddress;

  OrderEntity( {required this.cartEntity,  this.payWithCash,required this.shippingAddress,required this.uID});
  double calculateShippingCoast()
  {
    if(payWithCash==true)
      {
        return 30;
      }
    else
      {
        return 0;
      }

  }
  double calculateShippingDiscount() {
    return 0;
  }
  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() + calculateShippingCoast() - calculateShippingDiscount();
  }



}