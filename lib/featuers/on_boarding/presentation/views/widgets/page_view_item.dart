import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_prefrences_singleton.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.title, required this.subTitle, required this.imagePath, required this.backgroundImagePath, required this.isFirst});
  final String subTitle,imagePath,backgroundImagePath ;
  final Widget title;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height* 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                    backgroundImagePath,
                  fit: BoxFit.fill,
                ),
              ),
             Align(
               alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
            if(isFirst==true)
             GestureDetector(
               onTap: (){
                 Prefs.setBool(isBoarding, true);
                 Navigator.of(context).pushReplacementNamed(SignInView.routeName);
               },
               child: Padding(
                 padding:  const EdgeInsets.all(16.0),
                 child: Text(
                     'تخط',
                   style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF949D9E),),
                 ),
               ),
             )

            ]
          ),
        ),
        const SizedBox(height: 64.23,),
        title,
        const SizedBox(height: 24.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF4E5556),),
              subTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
