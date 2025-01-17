import 'package:flutter/material.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_bottom_navigation_item.dart';
import 'inactive_bottom_navigation_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isActive, required this.bottomNavigationBarEntity});
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isActive?  ActiveItem(image: bottomNavigationBarEntity.activeImage, name: bottomNavigationBarEntity.name,): InActiveItem(image:bottomNavigationBarEntity.inActiveImage);
  }
}
