import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';

import '../../cuibits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(

      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: CustomButton(
              text: 'الدفع ${CartCubit.of(context).cartEntity.calculateTotalPrice()} جنيه ',
              onPressed: (){

                Navigator.pushNamed(
                    context, CheckoutView.routeName,
                  arguments: CartCubit.of(context).cartEntity
                );

              },
            ),
          ),
        );
      },
    );
  }
}