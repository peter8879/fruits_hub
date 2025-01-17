import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/home/domain/entites/bottom_navigation_bar_entity.dart';

import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 65,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e){
          var index=e.key;
          var item=e.value;
          return Expanded(

            flex: index==currentIndex?3:2,
            child: GestureDetector(
                onTap: (){
                  currentIndex=index;
                  widget.onChanged(index);
                  setState(() {

                  });
                },
                child: NavigationBarItem(isActive: currentIndex==index, bottomNavigationBarEntity: item)
            ),
          );
        }).toList()

      )
    );
  }
}





