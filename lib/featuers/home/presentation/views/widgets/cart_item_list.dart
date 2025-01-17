import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_divider.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SliverList.separated(
          itemBuilder: (context, index) =>
              CartItem(cartItemEntity: cartItems[index],),
          itemCount: cartItems.length,
          separatorBuilder: (context, index) => const CustomDivider(),

        );
      },
    );
  }
}
