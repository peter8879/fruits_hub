import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key, required this.title, required this.subtitle, required this.price, required this.isActive, required this.onTap});
  final String title, subtitle;
  final String price;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding:  EdgeInsets.only(
          top: 16,
          left: 13,
          bottom: 16,
          right: isActive?9:0,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: isActive?AppColors.primaryColor:Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child:IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration:  ShapeDecoration(
                  color: isActive?AppColors.primaryColor:Colors.transparent,
                  shape: OvalBorder(
                    side: BorderSide(width: isActive?4:1, color:isActive?Colors.white:const  Color(0xFF949D9E)),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                     textAlign: TextAlign.start,
                    title,
                    style: AppTextStyles.semiBold13,
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    subtitle,
                    style: AppTextStyles.regular13.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(

                 price,
                  style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),

                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
