import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/address_widget.dart';


import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  OrderSummaryWidget(),
        const SizedBox(
          height: 16,
        ),
        AddressWidget(
          pageController: pageController,
        )
      ],
    );
  }
}


