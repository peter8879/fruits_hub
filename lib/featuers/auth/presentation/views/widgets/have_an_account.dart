import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: AppTextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
          ),

          const TextSpan(
            text: ' ',
            style: AppTextStyles.semiBold16,
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap=(){
                Navigator.pop(context);
              },
              text: 'تسجيل دخول',
              style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor)
          ),

        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
