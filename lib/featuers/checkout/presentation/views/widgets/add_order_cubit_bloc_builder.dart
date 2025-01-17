import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/helper_function/build_success_bar.dart';
import 'package:fruits_hub/core/widgets/custom_indicator.dart';
import 'package:fruits_hub/featuers/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AddOrderCubit,AddOrderState>(
      listener: (context,state){
        if(state is AddOrderSuccess){
          buildSuccessBar(context, 'تم اضافة الطلب بنجاح');
        }
        else if(state is AddOrderFailure){
          buildErrorBar(context, 'حدث خطأ ما ${state.message}');
        }

      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoading,
          progressIndicator: const CustomIndicator(),
          child: child,
        );
      },
    );
  }
}
