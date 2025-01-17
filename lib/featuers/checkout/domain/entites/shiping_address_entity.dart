class ShippingAddressEntity{
   String? name;
   String? address;
   String? city;
   String? phoneNumber;
   String? emailAddress;
   String? floorNumber;

  ShippingAddressEntity({
     this.name,
     this.address,
     this.city,
     this.phoneNumber,
     this.emailAddress,
     this.floorNumber,
  });
  String addressToString(){
    return '$address,  مبنى رقم $floorNumber';
  }
}