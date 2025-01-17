import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/utils/back_end_end_points.dart';

class ProductsRepoImpl extends ProductsRepo
{
  final DataBaseService dataBaseService;

  ProductsRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async{
    try{
      var data= await dataBaseService.getData(
        path: BackEndEndPoints.getProducts,
        query: {
          'limit':10,
          'orderBy':'sellingCount',
          'descending':true
        }
      ) as List<Map<String,dynamic>>;
      List<ProductModel> products=[];
      for (var e in data) {
        products.add(ProductModel.fromJson(e));
      }
      return Right(products);
    }
    catch(e){
      log(e.toString());
      return Left(ServerFailure('Failed to get products'));

    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    try{
      var data= await dataBaseService.getData(path: BackEndEndPoints.getProducts) as List<Map<String,dynamic>>;
      List<ProductModel> products=[];
     for (var e in data) {
       products.add(ProductModel.fromJson(e));
     }
     return Right(products);
    }
    catch(e){
      return Left(ServerFailure('Failed to get products'));

    }
  }

}