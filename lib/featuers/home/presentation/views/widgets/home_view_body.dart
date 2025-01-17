import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';

import 'best_seller_header.dart';
import 'products_grid_view.dart';
import 'products_grid_view_bloc_builder.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
    ProductsCubit.get(context).getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child:   Column(
              children: [
                SafeArea(child:  CustomHomeAppBar()),
                SizedBox(height: 12,),
                CustomSearchField(),
                SizedBox(height: 12,),
                FeaturedList(),
                SizedBox(height: 12,),
                BestSellerHeader(),
                SizedBox(height: 8,),




              ],
            ),
          ),
        ),
        ProductsGridViewBlocBuilder()

      ],
    );
  }
}

