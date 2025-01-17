import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/custom_checkbox.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
           value: isChecked,
          onChanged: (value) {
             isChecked= value;
             widget.onChanged(isChecked);
             setState(() {

             });

            // ignore: avoid_print
                  },

       ),
        const SizedBox(width: 16,),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF949D9E)),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF616A6B)),
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),

      ],
    );
  }
}
