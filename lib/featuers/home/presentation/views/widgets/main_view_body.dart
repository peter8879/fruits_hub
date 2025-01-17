import 'package:flutter/material.dart';

import '../cart_view.dart';
import '../products_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomeView(),
            ProductsView(),
            CartView(),
            SizedBox(),
          ],
        )
    );
  }
}