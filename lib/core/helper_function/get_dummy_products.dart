import 'dart:io';

import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: 'APL',
    description: 'Fresh and juicy apple',
    price: 1.5,
    isFeatured: true,
    imageUrl: null,
    expirationMonths: 2,
    isOrganic: true,
    numberOfCalories: 52,
    unitAmount: 1,
    reviews: [],
    avgRating: 4.5,
    sellingCount: 10,
  );
}
List<ProductEntity>getDummyProducts(){
  return List.generate(10, (index) => getDummyProduct());
}