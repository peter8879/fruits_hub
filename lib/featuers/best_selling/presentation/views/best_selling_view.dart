import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/best_selling/presentation/views/widgets/best_selling_view_body.dart';

import '../../../../core/helper_function/build_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الأكثر مبيعًا',
      ),
      body: const SafeArea(child: BestSellingViewBody()),
    );
  }

}
