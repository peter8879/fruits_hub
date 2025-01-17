import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';
import 'package:fruits_hub/featuers/home/presentation/views/main_view.dart';
import 'package:fruits_hub/featuers/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_prefrences_singleton.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../auth/presentation/views/signin_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    executeNavigation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        Center(
          child: SvgPicture.asset(Assets.imagesLogo),
        ),
        SvgPicture.asset(
            Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),

      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      bool boarding=Prefs.getBool(isBoarding);
      if(boarding==false)
      {

        Navigator.pushReplacementNamed(context, OnBoardingView.routeName );
      }
      else
      {
        var isLogin=FirebaseAuthService().isUserLoggedIn();
        if(isLogin==true)
        {
          Navigator.pushReplacementNamed(context, MainView.routeName );
        }
        else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }

      }
    });
  }
}
