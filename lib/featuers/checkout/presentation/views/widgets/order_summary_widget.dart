import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.regular13.copyWith(color: const Color(0xFF4E5556)),
              ),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                style: AppTextStyles.semiBold13,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل  :',
                style: AppTextStyles.regular13.copyWith(color: const Color(0xFF4E5556)),
              ),
              Text(
                '40 جنيه',
                style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF4E5556)),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 42),
            child: Divider(
              color:  Color(0xFFCACECE),
              thickness: 0.5,

            ),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكلي',
                style: AppTextStyles.bold16,
              ),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()+40} جنيه',
                style: AppTextStyles.bold16,
              ),
            ],
          ),

        ],

      ),
    );
  }
}