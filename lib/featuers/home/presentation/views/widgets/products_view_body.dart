

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper_function/build_app_bar.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_seller_header.dart';
import 'products_grid_view_bloc_builder.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';
import 'product_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
     ProductsCubit.get(context).getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    log('${context.watch<ProductsCubit>().productLength} product length');
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:  Padding(
            padding: const  EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child:   Column(
              children: [
                buildAppBar(context, title: 'المنتجات',isHome: true),
                const SizedBox(height: 12,),
                const CustomSearchField(),
                const SizedBox(height: 12,),
                ProductViewHeader(productLength: ProductsCubit.get(context).productLength,),
                const SizedBox(height: 12,),






              ],
            ),
          ),
        ),
         const ProductsGridViewBlocBuilder(),

      ],
    );
  }
}
