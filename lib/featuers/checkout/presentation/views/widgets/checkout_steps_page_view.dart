import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/shiping_section.dart';

import 'check_out_steps.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.formKey, required this.valueListenable, required this.pageController,
  }) ;

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context,index)=>getPages()[index],
      ),
    );
  }
  List<Widget> getPages(){
    return[
      const ShippingSection(),
       AddressInputSection(
        formKey: formKey,
        valueListenable:valueListenable
      ),
       PaymentSection(
         pageController: pageController,
       ),
    ];
  }
}