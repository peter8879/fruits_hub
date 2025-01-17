import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/best_selling/presentation/views/best_selling_view.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعًا',
          style: AppTextStyles.bold16,
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
            style: AppTextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          ),
        ),

      ],
    );
  }
}
