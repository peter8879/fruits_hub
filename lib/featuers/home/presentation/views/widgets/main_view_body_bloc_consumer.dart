import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/build_success_bar.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';

import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
       if(state is CartItemAdded){
         buildSuccessBar(context, 'تم اضافه المنتج الي السله بنجاح');
       }
       if(state is CartItemRemoved){
         buildSuccessBar(context, 'تم حذف المنتج من السله بنجاح');
       }
      },
      child: MainViewBody(currentIndex: currentIndex),

    );
  }
}