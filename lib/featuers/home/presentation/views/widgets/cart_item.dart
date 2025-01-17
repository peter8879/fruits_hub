import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_image.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';


class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if(current is ItemUpdated){
          if(current.cartItemEntity==cartItemEntity){
            return true;
          }

        }
        return false;
      },
      builder: (context, state) {
        log('CartItem build');
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 17,),
              Container(
                height: 92,
                width: 73,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomImage(imageUrl: cartItemEntity.product.imageUrl!),
              ),
              const SizedBox(width: 17,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          cartItemEntity.product.name,
                          style: AppTextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              CartCubit.of(context).removeFromCart(
                                  cartItemEntity);
                            },
                            child: SvgPicture.asset(Assets.imagesTrashIcon)
                        ),
                        const SizedBox(width: 17,),


                      ],
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} كم',
                      style: AppTextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor),
                    ),
                    const SizedBox(height: 6,),

                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity,),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنية',
                          style: AppTextStyles.bold16.copyWith(color: AppColors
                              .secondaryColor),

                        ),
                        const SizedBox(width: 17.5,)

                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


