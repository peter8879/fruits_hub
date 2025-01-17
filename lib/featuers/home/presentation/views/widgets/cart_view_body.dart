import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_function/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_divider.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/cart_item_list.dart';

import 'custom_cart_button.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:  Column(
                children: [
                  buildAppBar(context, title: 'السلة',showNotification: false),
                  const SizedBox(height: 16,),
                  const CartHeader(),
                  const SizedBox(height: 23,),
                  if(CartCubit.of(context).cartEntity.cartItems.isNotEmpty)
                  const CustomDivider()

                ],
              ),
            ),
             CartItemList(
             cartItems: CartCubit.of(context).cartEntity.cartItems,
           ),
            if(CartCubit.of(context).cartEntity.cartItems.isNotEmpty)
              const SliverToBoxAdapter(
                child: CustomDivider(),
              )


          ],
        ),
        if(context.watch<CartCubit>().cartEntity.cartItems.isNotEmpty)
        Positioned(
          bottom: MediaQuery.sizeOf(context).width*0.08,
          left: 0,
          right: 0,
          child: const  CustomCartButton(),
        )
      ],
    );
  }
}


