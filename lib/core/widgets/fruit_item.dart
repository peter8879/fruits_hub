
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
      child: Stack(
        children: [
          Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Flexible(child: SizedBox(height: 20,)),
                  AspectRatio(
                    aspectRatio: 131/99,
                    child: product.imageUrl!=null?CachedNetworkImage(
                      imageUrl: product.imageUrl!,
                    ):const SizedBox(),
                  ),
                  const Spacer(),
                  ListTile(
                    title :  Text(
                      product.name,
                      style: AppTextStyles.semiBold16,
                    ),
                    subtitle: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${product.price.toString()} جنية ',
                              style: AppTextStyles.bold13.copyWith(color: AppColors.secondaryColor),
                            ),
                            TextSpan(
                              text: '/',
                              style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightSecondaryColor),
                            ),
                            TextSpan(
                              text: ' الكيلو',
                              style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightSecondaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    trailing:  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: GestureDetector(
                        onTap: (){
                          CartCubit.of(context).addToCart(product);
                        },
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )


                ],
              )
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: (){

              },
              icon: const Icon(
                Icons.favorite_border
              ),
            ),
          ),


        ],
      ),

    );
  }
}
