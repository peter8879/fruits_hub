import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/featuers/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int _selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Column(
      children: [
        ShippingItem(
          onTap: (){
            context.read<OrderEntity>().payWithCash = true;
            setState(() {
              _selectedItem = 0;
            });
          },
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()+ 40} جنيه ',
          isActive: _selectedItem == 0?true:false,
        ),
        const SizedBox(height: 16,),
        ShippingItem(
          onTap: (){
            context.read<OrderEntity>().payWithCash = false;
            setState(() {
              _selectedItem = 1;
            });
          },
          title: 'الدفع عن البطاقه',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه ',
          isActive: _selectedItem == 1?true:false,
        ),

      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
