import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_decoration.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:svg_flutter/svg.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.greyBoxDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           children: [
             Text(
               'عنوان التوصيل',
               style: AppTextStyles.bold13,
             ),
              const Spacer(),
             GestureDetector(
               onTap: (){
                 pageController.animateTo(1,duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                 
               },
               child: Row(
                 children: [
                   SvgPicture.asset(Assets.imagesPenIcon),
                    const SizedBox(width: 6,),
                   Text(
                     'تعديل',
                     style: AppTextStyles.regular13.copyWith(color:  const Color(0xFF949D9E)),
                   ),
                 ],
               ),
             )
           ],
         ),
         const SizedBox(height: 8,),
          Row(
            children: [
            SvgPicture.asset(Assets.imagesLocationIcon),
              const SizedBox(width: 8,),
              Text(
                context.read<OrderEntity>().shippingAddress.addressToString(),
                style: AppTextStyles.regular13.copyWith(color: const Color(0xFF4E5556)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
