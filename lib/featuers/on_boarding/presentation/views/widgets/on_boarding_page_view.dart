import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/featuers/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:  [
        PageViewItem(
          isFirst: true,
          imagePath: Assets.imagesPageViewItem1Image,
          backgroundImagePath: Assets.imagesPageViewItem1BackgroundImage,
          subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبًا بك في',
                style: AppTextStyles.bold23,
              ),
              const SizedBox(width:3),
              Text(
                  'HUB',
                style: AppTextStyles.bold23.copyWith(color: AppColors.secondaryColor),

              ),
               Text(
                   'Fruit',
                 style: AppTextStyles.bold23.copyWith(color: AppColors.primaryColor)
               ),


            ],
          ),


        ),
        const PageViewItem(
          isFirst: false,
          imagePath: Assets.imagesPageViewItem2Image,
          backgroundImagePath: Assets.imagesPageViewItem2BackgroundImage,
          subTitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
    'ابحث وتسوق',
    textAlign: TextAlign.center,
    style: AppTextStyles.bold23,


        ),
        ),

      ],
    );
  }
}
