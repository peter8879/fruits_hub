import 'package:fruits_hub/core/helper_function/get_currency.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';

import 'order_entity.dart';

class PaypalPaymentEntity {
  final Amount? amount;
  final String? description;
  final ItemList? itemList;

  PaypalPaymentEntity({
    this.amount,
    this.description,
    this.itemList,
  });
  factory PaypalPaymentEntity.fromEntity(OrderEntity orderEntity){
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'Payment for order',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount?.toJson(),
      'description': description,
      'item_list': itemList?.toJson(),
    };
  }
}

class Amount {
  final String? total;
  final String? currency;
  final DetailsEntity? details;

  Amount({
    this.total,
    this.currency,
    this.details,
  });
  factory Amount.fromEntity(OrderEntity orderEntity){
    return Amount(
      total: orderEntity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details?.toJson(),
    };
  }
}

class DetailsEntity {
  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  DetailsEntity({
    this.subtotal,
    this.shipping,
    this.shippingDiscount,
  });

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
      shipping: orderEntity.calculateShippingCoast().toString(),
      shippingDiscount: orderEntity.calculateShippingDiscount().toInt(),
    );
  }
}

class ItemList {
  final List<ItemEntity>? items;

  ItemList({
    this.items,
  });
  factory ItemList.fromEntity(List<CartItemEntity> items){
    return ItemList(
      items: items.map((item) => ItemEntity.fromEntity(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}

class ItemEntity {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  ItemEntity({
    this.name,
    this.quantity,
    this.price,
    this.currency,
  });
  factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) {
    return ItemEntity(
      name: cartItemEntity.product.name,
      quantity: cartItemEntity.quantity,
      price: cartItemEntity.product.price.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
