import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/featured_item_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../../../../../core/utils/assets.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width*0.9;
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4)
      ),
      child: Stack(
        children: [
         Positioned(
           left: 0,
           bottom: 0,
           top: 0,
           right: width*0.4,
           child: Image.asset(
               Assets.imagesFruitsTest,
             fit: BoxFit.fill,
           ),
         ),
          Container(
            width: width*0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: Svg(
                    Assets.imagesFeaturedItemBackground,
                ),
                fit: BoxFit.fill
              ),


            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(child: SizedBox(height: 25,)),
                  Text(
                    'عروض العيد',
                    style: AppTextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    'خصم 25%',
                    style: AppTextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 11,),

                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: FeaturedItemButton(
                        text: 'تسوق الان',
                        onPressed: (){

                        },
                      ),

                    ),
                  ),
                  const Flexible(
                    child: SizedBox(height: 29,),
                  ),


                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
