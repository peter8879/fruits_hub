import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.image, required this.title, required this.onPressed});
  final String image,title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 1,
              color:  Color(0xFFDCDEDE)
            )
          ),
        ),
        onPressed: onPressed,
       child: ListTile(
         visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
         leading: SvgPicture.asset(image),
         title: Text(
           title,style: AppTextStyles.semiBold16.copyWith(color:  Colors.black),
           textAlign: TextAlign.center,
         ),
       ),

      ),
    );
  }
}
