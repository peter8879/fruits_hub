import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342/158,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>const FeaturedItem(),
        itemCount: 4,
      ),
    );
  }
}
