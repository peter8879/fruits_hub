import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';

import '../entites/user_entity.dart';


abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    });
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure,UserEntity>> signInWithGoogle();
  Future<Either<Failure,UserEntity>> signInWithFaceBook();
  Future<Either<Failure,UserEntity>> signInWithApple();
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
  Future saveUserData({required UserEntity user});


}


