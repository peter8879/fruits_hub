import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/featuers/checkout/domain/entites/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  static AddOrderCubit get(context) => BlocProvider.of(context);
  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    var result=await ordersRepo.addOrder(orderEntity);
    result.fold(
        (l) => emit(AddOrderFailure(l.message)),
        (r) => emit(AddOrderSuccess())
    );
  }
}
