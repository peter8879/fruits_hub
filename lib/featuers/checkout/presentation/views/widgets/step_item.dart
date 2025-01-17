import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/active_check_item.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key, required this.index, required this.title, required this.isActive});

  final int index;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(title: title, index: index),
      secondChild: ActiveStepItem(title: title),
      crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState
          .showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
