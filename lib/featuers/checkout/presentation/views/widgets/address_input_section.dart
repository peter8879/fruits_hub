import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey ;
  final  ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:  ValueListenableBuilder<AutovalidateMode>(
       builder: (context,value,child){
         return Form(
           key: formKey,
           autovalidateMode: value,
           child: Column(
             children: [
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.name = value;

                 },
                 hint: 'الاسم كامل',
                 keyboardType: TextInputType.text,
               ),
               const SizedBox(
                 height: 8,
               ),
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.phoneNumber = value;

                 },
                 hint: 'رقم الهاتف',
                 keyboardType: TextInputType.phone,
               ),
               const SizedBox(
                 height: 8,
               ),
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.emailAddress = value;

                 },
                 hint: 'البريد الإلكتروني',
                 keyboardType: TextInputType.emailAddress,
               ),
               const SizedBox(
                 height: 8,
               ),
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.address = value;

                 },
                 hint: 'العنوان',
                 keyboardType: TextInputType.streetAddress,
               ),
               const SizedBox(
                 height: 8,
               ),
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.city = value;

                 },
                 hint: 'المدينه',
                 keyboardType: TextInputType.text,
               ),
               const SizedBox(
                 height: 8,
               ),
               CustomTextFormField(
                 onSaved: (value){
                   context.read<OrderEntity>().shippingAddress!.floorNumber = value;

                 },
                 hint: 'رقم الطابق , رقم الشقه ..',
                 keyboardType: TextInputType.number,
               ),

             ],
           ),
         );
       }, valueListenable: valueListenable,
      ),
    );
  }
}
