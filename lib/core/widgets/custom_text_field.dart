import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.keyboardType,  this.suffixIcon,this.obscureText, this.onSaved});
  final String hint;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved: onSaved ,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: (value)
      {
        if(value!.isEmpty||value==null)
        {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },

      decoration:  InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: hint,
        hintStyle: AppTextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        suffixIcon: suffixIcon,


      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width:1,
          color: Color(0xFFE6E9E9),

        )
      );
  }
}
