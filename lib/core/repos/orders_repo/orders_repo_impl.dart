import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/utils/back_end_end_points.dart';
import 'package:fruits_hub/featuers/checkout/data/models/order_model.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo
{
  DataBaseService dataBaseService;
  OrdersRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async{
   try{
     var result= await dataBaseService.addData(path: BackEndEndPoints.addOrder, data: OrderModel.fromEntity(orderEntity).toJson());
     return Right(result);

   }
   catch(e){
     return Left(ServerFailure(e.toString()));
   }
  }
  
}