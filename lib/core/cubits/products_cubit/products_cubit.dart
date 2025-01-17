import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productLength = 0;
  static ProductsCubit get(context) => BlocProvider.of(context);
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final products = await productsRepo.getProducts();
    products.fold(
      (l) => emit(ProductsFailure(l.message)),
      (r) {
        emit(ProductsSuccess(r));
        productLength+=r.length;
      },
    );
  }
  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final products = await productsRepo.getBestSellingProducts();
    products.fold(
          (l) => emit(ProductsFailure(l.message)),
          (r) => emit(ProductsSuccess(r)),
    );
  }
}
