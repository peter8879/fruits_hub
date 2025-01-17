import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productLength});
  final int productLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          '${productLength.toString()}  نتائج',
          style: AppTextStyles.bold16,
        ),
        const Spacer(),
         Container(
           width: 44,
           height: 31,
           decoration: ShapeDecoration(
             color: Colors.white.withOpacity((0.10000000149011612)),
             shape: RoundedRectangleBorder(
               side: const BorderSide(width: 1, color: Color(0x66CACECE)),
               borderRadius: BorderRadius.circular(4),
             ),
           ),
           child: Center(child: SvgPicture.asset(Assets.imagesArrowSwap)),
         )

      ],
    );
  }
}
