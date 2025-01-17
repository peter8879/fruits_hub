
import 'dart:io';

import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/models/review_model.dart';

import '../helper_function/getAvgRating.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.name, required super.code, required super.description, required super.price, required super.isFeatured, super.imageUrl, required super.expirationMonths, super.isOrganic, required super.numberOfCalories, required super.unitAmount, required super.reviews, super.sellingCount = 0, required super.avgRating});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      if(imageUrl != null)
        'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'ratingCount': ratingCount,
      'avgRating': avgRating,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => ReviewModel.fromEntity(e).toMap()).toList()
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity)
  {
    return ProductModel(
        name: entity.name,
        code: entity.code,
        description: entity.description,
        price: entity.price,
        isFeatured: entity.isFeatured,
        imageUrl: entity.imageUrl,
        expirationMonths: entity.expirationMonths,
        isOrganic: entity.isOrganic,
        numberOfCalories: entity.numberOfCalories,
        unitAmount: entity.unitAmount,
        reviews: entity.reviews,
        sellingCount: entity.sellingCount,
        avgRating: entity.avgRating
    );
  }

  factory ProductModel.fromJson (Map<String, dynamic> json)
  {
    return ProductModel(

        name: json['name'],
        code: json['code'],
        description: json['description'],
        price: json['price'],
        isFeatured: json['isFeatured'],
        imageUrl: json['imageUrl'],
        expirationMonths: json['expirationMonths'],
        isOrganic: json['isOrganic'],
        numberOfCalories: json['numberOfCalories'],
        unitAmount: json['unitAmount'],
        sellingCount: json['sellingCount'],
        avgRating: getAvgRating(json['reviews'] != null ? (json['reviews'] as List).map((e) =>
            ReviewModel.fromJson(e)).toList() : []),
        reviews: json['reviews'] != null ? (json['reviews'] as List).map((e) =>
            ReviewModel.fromJson(e)).toList() : []
    );
  }

}
