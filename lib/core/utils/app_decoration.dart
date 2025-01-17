import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

abstract class AppDecoration
{
  static  Decoration greyBoxDecoration=ShapeDecoration(
    color:  const Color(0x33D9D9D9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );


}