import 'profile_entity.dart';

class ProfileResponseEntity {
  final int code;
  final String message;
  final ProfileEntity data;

  ProfileResponseEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}