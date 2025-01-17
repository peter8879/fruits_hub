import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';

abstract class OrdersRepo{
  Future<Either<Failure,void>> addOrder(OrderEntity orderEntity);
}