class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;
  final String? phone;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.photoUrl,
  });


}
