import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/get_user.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/get_it__service.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/featuers/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper_function/build_app_bar.dart';
import '../../domain/entites/shiping_address_entity.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView>
    with AutomaticKeepAliveClientMixin {
  late OrderEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderEntity(
      cartEntity: super.widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
      uID: getUser().id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(child:  CheckoutViewBody()),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
