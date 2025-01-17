import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.value, required this.onChanged});
  final bool value;
  final ValueChanged<bool> onChanged;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChanged(!value);
      },
      child: Flexible(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 25,
          height: 24,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: value?AppColors.primaryColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side:  BorderSide(
                  width: 1.50,
                  color: value?Colors.transparent: const Color(0xFFDCDEDE)
              )
            ),

          ),
            child: value?const Icon(Icons.check_sharp,color: Colors.white,size: 16,):null

        ),
      ),
    );
  }
}
