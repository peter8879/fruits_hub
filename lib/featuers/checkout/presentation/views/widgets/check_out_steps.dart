import 'package:flutter/material.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/active_check_item.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/step_item.dart';

import 'inactive_step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key, required this.currentPage, required this.pageController});
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: List.generate(
        getSteps().length,
          (index){
         if(index<=currentPage)
           {
             return  Expanded(
               child: GestureDetector(
                 onTap: (){
                    pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                 },
                 child: StepItem(
                   title: getSteps()[index],
                   index: index+1,
                   isActive: true,
                 ),
               ),
             );
           }
         else
           {
             return  Expanded(
               child: StepItem(
                 title: getSteps()[index],
                 index: index+1,
                 isActive: false,
               ),
             );
           }
          }
      ),
    );
  }

}
List<String>getSteps(){
  return[
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
