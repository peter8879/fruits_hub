import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import '../signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟',
            style: AppTextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
          ),

          const TextSpan(
            text: ' ',
            style: AppTextStyles.semiBold16,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap=(){
              Navigator.pushNamed(context, SignupView.routeName);
            },
              text: 'قم بإنشاء حساب',
              style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor)
          ),

        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
