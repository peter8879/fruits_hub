import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper_function/build_app_bar.dart';
import '../../domain/entites/shiping_address_entity.dart';

class CheckoutView extends StatefulWidget  {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> with AutomaticKeepAliveClientMixin {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity=OrderEntity(
      cartEntity: super.widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      appBar: buildAppBar(context, title: 'الشحن',showNotification: false),
      body: Provider.value(
        value: orderEntity,
        child: const  CheckoutViewBody(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
