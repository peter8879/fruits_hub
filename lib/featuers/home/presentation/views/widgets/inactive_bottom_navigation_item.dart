import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.transparent,
      duration: const Duration(milliseconds: 800),
        child: SvgPicture.asset(image)
    );
  }
}