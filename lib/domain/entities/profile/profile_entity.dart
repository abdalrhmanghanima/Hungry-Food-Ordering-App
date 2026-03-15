class ProfileEntity {
  final String name;
  final String email;
  final String image;
  final String? address;
  final String? visa;

  ProfileEntity({
    required this.name,
    required this.email,
    required this.image,
    this.address,
    this.visa,
  });
}