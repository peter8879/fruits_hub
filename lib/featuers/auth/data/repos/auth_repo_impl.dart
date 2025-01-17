import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/errors/exeptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';
import 'package:fruits_hub/core/services/shared_prefrences_singleton.dart';
import 'package:fruits_hub/core/utils/back_end_end_points.dart';
import 'package:fruits_hub/featuers/auth/data/models/user_model.dart';

import '../../domin/entites/user_entity.dart';
import '../../domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl( {required this.firebaseAuthService,required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password, required String name}) async{
    User? user;
     try{
        user= await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
       UserEntity userEntity= UserEntity(id: user.uid, email: user.email!, name: name);
       await addUserData(user: userEntity);
       await saveUserData(user: userEntity);
       return right(userEntity);
     }
    on CustomException catch(e){
       if(user!=null)
         {
          await firebaseAuthService.deleteUser();
         }

      return left(ServerFailure(e.message));
    }
    catch(e){
       log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
       if(user!=null)
       {
         await firebaseAuthService.deleteUser();
       }
      return left(ServerFailure('حدث خطأ أثناء إنشاء الحساب برجاء المحاولة مرة أخرى'));
    }

  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async{
    try
        {
          User user=  await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
          var userData= await getUserData(uId: user.uid);
          await saveUserData(user: userData);
          return right(userData);
        }
        on CustomException catch(e){

          return left(ServerFailure(e.message));
        }
        catch(e){
          log('Exception in signInWithEmailAndPassword: ${e.toString()}');
          return left(ServerFailure('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى'));

        }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async{
    User? user;
   try{
      user= await firebaseAuthService.signInWithGoogle();
     UserEntity userEntity= UserModel.fromFirebaseUser(user);
     var isExist= await dataBaseService.ifDataExist(id: user.uid, path: BackEndEndPoints.isUserExist);
     if(isExist)
       {
         var dataUser=await getUserData(uId: user.uid);
         await saveUserData(user: dataUser);
         return right(dataUser);
       }
     else {
       await addUserData(user: userEntity);
       await saveUserData(user: userEntity);
       return right(userEntity);
     }
   }
   catch(e){
     if(user!=null)
     {
       await firebaseAuthService.deleteUser();
     }
     log('Exception in signInWithGoogle: ${e.toString()}');
     return left(ServerFailure('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى'));

   }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFaceBook() async{
    User? user;
    try{
       user= await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity= UserModel.fromFirebaseUser(user);
       var isExist= await dataBaseService.ifDataExist(id: user.uid, path: BackEndEndPoints.isUserExist);
       if(isExist)
       {
         var dataUser=await getUserData(uId: user.uid);
         await saveUserData(user: userEntity);
         return right(dataUser);
       }
       else {
         await addUserData(user: userEntity);
         await saveUserData(user: userEntity);
         return right(userEntity);
       }
    }
    catch(e)
    {
      if(user!=null)
      {
        await firebaseAuthService.deleteUser();
      }
      log('Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async{
    try{
      var user=await firebaseAuthService.signInWithApple();
      UserEntity userEntity= UserModel.fromFirebaseUser(user);
      var isExist= await dataBaseService.ifDataExist(id: user.uid, path: BackEndEndPoints.isUserExist);
      if(isExist)
      {
        var dataUser=await getUserData(uId: user.uid);
        await saveUserData(user: userEntity);
        return right(dataUser);
      }
      else {
        await addUserData(user: userEntity);
        await saveUserData(user: userEntity);
        return right(userEntity);
      }


    }
    catch(e)
    {
      log('Exception in signInWithApple: ${e.toString()}');
      return left(ServerFailure('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async{
    UserModel model= UserModel(id: user.id, email: user.email, name: user.name,photoUrl: user.photoUrl,phone: user.phone);
   await dataBaseService.addData(path: BackEndEndPoints.addUserData, data: model.toMap(),documentId: user.id);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async{
   var user = await dataBaseService.getData(
     id: uId,
     path:BackEndEndPoints.getUserData,
    );
    return UserModel.fromJson(json: user);
  }

  @override
  Future saveUserData({required UserEntity user}) async{
    var jasonData= jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jasonData);

  }

}