import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 41,
      padding: const EdgeInsets.symmetric( vertical: 10),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child:  Center(
        child:  Text(
          ' لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق ',
          style: AppTextStyles.regular13.copyWith(color: const Color(0xFF00A650)),
        ),
      ),
    );;
  }
}
