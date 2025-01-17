import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_text_styles.dart';
import '../utils/assets.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ]
      ),
      child:  TextField(
        keyboardType: TextInputType.text,

        decoration:  InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          disabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          hintText: 'ابحث عن.......',
          hintStyle: AppTextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          suffixIcon: SvgPicture.asset(
              Assets.imagesFilterIcon,
            fit: BoxFit.scaleDown,
          ),
          prefixIcon: SvgPicture.asset(
              Assets.imagesSearchIcon,
            fit: BoxFit.scaleDown,

          ),


        ),
      ),
    );
  }
  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.white,

        )
    );
  }
}
