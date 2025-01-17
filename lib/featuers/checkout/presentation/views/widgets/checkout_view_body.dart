import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/paypal_payment_entity.dart';
import 'package:fruits_hub/featuers/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/check_out_steps.dart';

import 'checkout_steps_page_view.dart';


class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
 late  PageController _pageController;
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);
 @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener((){
      setState(() {
        currentPage = _pageController.page!.round();
      });

    });
    super.initState();
  }
 int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
             CheckOutSteps(
              currentPage: currentPage,
               pageController: _pageController,
            ),
            const SizedBox(height: 32,),
            CheckOutStepsPageView(
                pageController: _pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: CustomButton(
                  text: getNextButtonText(currentPage),
                  onPressed: (){{
                    if(currentPage==0) {
                      _handleShippingSectionValidation(context);
                    }
                    else if(currentPage == 1)
                      {
                        _handleAddressSectionValidation();
                      }
                    else
                      {
                       _processPayment();
                      }
                   

                  }
    }
              )
              ,
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
                child: SizedBox(height: 180,),
            ),

          ],
        ),
      ),
    );
  }

  void _handleAddressSectionValidation() {
    if(_formKey.currentState!.validate())
      {
        _formKey.currentState!.save();
        _pageController.nextPage(duration: const Duration(milliseconds: 200) , curve: Curves.easeIn) ;
      }
    else
      {
        valueNotifier.value = AutovalidateMode.always;
      }
  }

  void _handleShippingSectionValidation(BuildContext context) {
     if(context.read<OrderEntity>().payWithCash != null)
      {
        _pageController.nextPage(duration: const Duration(milliseconds: 200) , curve: Curves.easeIn) ;

      }

    else
      {
       buildErrorBar(context, 'يرجي تحديد طريقه الدفع');
      }
  }
  @override
  dispose(){
    _pageController.dispose();
    super.dispose();
    valueNotifier.dispose();
  }
  String getNextButtonText(int currentPage){
    if(currentPage == 0||currentPage == 1)
      {
        return 'التالى';
      }
    else
      {
        if(context.read<OrderEntity>().payWithCash == true)
          {
            return 'تاكيد الطلب';
          }
        else
          {
            return '  الدفع عن طريق Paypal';
      }
  }


  }
 void _processPayment() {
    var addOrderCubit = AddOrderCubit.get(context);
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(orderEntity);
    log(paypalPaymentEntity.toJson().toString());
   if(context.read<OrderEntity>().payWithCash == true)
   {
     addOrderCubit.addOrder(context.read<OrderEntity>());

   }
   else
   {
     Navigator.of(context).push(MaterialPageRoute(
       builder: (BuildContext context) => PaypalCheckoutView(
         sandboxMode: true,
         clientId: kPaypalClientId,
         secretKey: kPaypalSecretKey,
         transactions:  [
          paypalPaymentEntity.toJson(),
         ],
         note: "Contact us for any questions on your order.",
         onSuccess: (Map params) async {
           addOrderCubit.addOrder(context.read<OrderEntity>());
         },
         onError: (error) {
           log(error.toString());
          buildErrorBar(context, error.toString());
         },
         onCancel: () {

         },
       ),
     ));

   }

 }
}


