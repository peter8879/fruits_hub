import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/featuers/home/presentation/cuibits/cart_cuibit/cart_cubit.dart';
import 'package:fruits_hub/featuers/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_hub/featuers/home/presentation/views/products_view.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';


  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(onChanged: (index) {
          currentIndex = index;
          setState(() {

          });
        },),
        body: MainViewBodyBlocConsumer(currentIndex: currentIndex),

      ),
    );
  }

}




