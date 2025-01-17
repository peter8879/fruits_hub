import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/featuers/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../../core/services/shared_prefrences_singleton.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPageIndex=0;
  @override
  void initState() {
    pageController=PageController();
    pageController.addListener((){
      currentPageIndex=pageController.page!.round();
      setState(() {

      });

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
        Expanded(child: OnBoardingPageView(pageController: pageController,)),
        DotsIndicator(
          position: currentPageIndex,
            dotsCount: 2,
          decorator:  DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: const Color(0xFF5DB957).withOpacity(0.50),
            size: const Size(9, 9),

          ),
        ),
        if(currentPageIndex==1)
        const SizedBox(height: 29.0,),
        if(currentPageIndex==1)
         Padding(
          padding:  const EdgeInsets.symmetric(horizontal: kHorizintalPadding)  ,
          child:  SizedBox(
            height: 54,
            width: double.infinity,
            child:  CustomButton(
              onPressed: (){
                Prefs.setBool(isBoarding, true);
                Navigator.of(context).pushReplacementNamed(SignInView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        const SizedBox(height: 43.0,)

      ],
    );
  }
  @override
  dispose(){
    pageController.dispose();
    super.dispose();
  }
}
