import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.name});
  final String image,name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        padding: const EdgeInsetsDirectional.only(end: 10),
        decoration: ShapeDecoration(
          color:const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
         children: [
          Container(
          width: 30,
          height: 30,
          decoration: ShapeDecoration(
            color: const Color(0xFF1B5E37),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
            child: Center(child: SvgPicture.asset(image)),
          ),
           const SizedBox(width: 4,),
           Text(
             name,
             style: AppTextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
           )
         ],
        ),
      ),
    );
  }
}