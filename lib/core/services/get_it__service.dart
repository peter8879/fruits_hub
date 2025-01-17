import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/fire_store_service.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';
import 'package:fruits_hub/featuers/auth/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../featuers/auth/domin/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(dataBaseService: getIt<DataBaseService>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>(),dataBaseService: getIt<DataBaseService>()));
}