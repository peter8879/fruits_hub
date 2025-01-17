import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFDCDEDE),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'أو',
            style: AppTextStyles.semiBold16,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
