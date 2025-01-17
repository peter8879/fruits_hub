import 'package:fruits_hub/featuers/checkout/domain/entites/shiping_address_entity.dart';

class ShippingAddressModel{
  String? name;
  String? address;
  String? city;
  String? phoneNumber;
  String? emailAddress;
  String? floorNumber;

  ShippingAddressModel({
    this.name,
    this.address,
    this.city,
    this.phoneNumber,
    this.emailAddress,
    this.floorNumber,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity){
    return ShippingAddressModel(
      name: entity.name,
      address: entity.address,
      city: entity.city,
      phoneNumber: entity.phoneNumber,
      emailAddress: entity.emailAddress,
      floorNumber: entity.floorNumber,
    );
  }
  Map<String ,dynamic> toJson(){
        return {
      'name': name,
      'address': address,
      'city': city,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'floorNumber': floorNumber,
    };

  }

}