import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';



class ProductEntity extends Equatable
{
final String name,code,description;
final num price;
final bool isFeatured;
 String? imageUrl;
 final int expirationMonths;
 final bool isOrganic;
 final int numberOfCalories;
 final int unitAmount;
 final num avgRating;
 final num ratingCount=0;
 final num sellingCount;
 final List<ReviewEntity> reviews;

  ProductEntity(  {required this.name, required this.code, required this.description, required this.price, required this.isFeatured, this.imageUrl, required this.expirationMonths,  this.isOrganic=false, required this.numberOfCalories, required this.unitAmount,required this.reviews,required this.sellingCount,required this.avgRating});

  @override
  // TODO: implement props
  List<Object?> get props => [code,name];

}