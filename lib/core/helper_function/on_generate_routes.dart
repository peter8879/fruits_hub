
import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/featuers/best_selling/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/featuers/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/featuers/home/presentation/views/main_view.dart';

import '../../featuers/auth/presentation/views/signup_view.dart';
import '../../featuers/on_boarding/presentation/views/on_boarding_view.dart';
import '../../featuers/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings)
{
  switch(settings.name)
  {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
    return MaterialPageRoute(builder: (_)=>const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_)=>const BestSellingView());
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (_)=> CheckoutView(
       cartEntity:settings.arguments as CartEntity ,
      ));
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }

}