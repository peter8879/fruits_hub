import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_item_cubit/cart_item_cubit.dart';
import 'package:svg_flutter/svg.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          onPressed: (){
            cartItemEntity.increaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);

          },
          icon: SvgPicture.asset(
            Assets.imagesPlusIcon,
            width: 28,
            height: 28,
          ),
        ),
        const SizedBox(width: 16,),
         Text(
          '${cartItemEntity.quantity}',
          textAlign: TextAlign.center,
          style: AppTextStyles.bold16,
        ),
        const SizedBox(width: 16,),
       CartItemActionButton(
         onPressed: (){
           if(cartItemEntity.quantity>1)
             {
               log('decrease');
               cartItemEntity.decreaseQuantity();
               context.read<CartItemCubit>().updateCartItem(cartItemEntity);
             }


         },
         icon:  SvgPicture.asset(
           Assets.imagesMinusIcon,
           width: 29,
           height: 29,
         ),
       )
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key, required this.icon, required this.onPressed});
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {

    return  IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}

