
import 'package:firebase_auth/firebase_auth.dart';

import '../../domin/entites/user_entity.dart';

class UserModel extends UserEntity
{
  UserModel({required super.id, required super.email, required super.name,super.phone,super.photoUrl});
  factory UserModel.fromFirebaseUser(User user)
  {
    return UserModel(
      id: user.uid,
      email: user.email!,
      name: user.displayName??'',
    );
  }
  factory UserModel.fromJson({required Map<String,dynamic> json})
  {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      photoUrl: json['photoUrl']
    );
  }
  factory UserModel.fromEntity(UserEntity entity)
  {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      phone: entity.phone,
      photoUrl: entity.photoUrl
    );
  }
  Map<String,dynamic> toMap()
  {
    return{
      'id':id,
      'email':email,
      'name':name,
      if(photoUrl!=null)
        'photoUrl':photoUrl,
      if(phone!=null)
        'phone':phone
    };
  }



}