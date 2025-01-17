import 'dart:convert';

import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_prefrences_singleton.dart';
import 'package:fruits_hub/featuers/auth/data/models/user_model.dart';

import '../../featuers/auth/domin/entites/user_entity.dart';

UserEntity getUser(){
  var jsonString=Prefs.getString(kUserData);
  var userEntity=UserModel.fromJson(json: jsonDecode(jsonString));
  return userEntity;
}