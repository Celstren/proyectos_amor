import 'package:objectbox/objectbox.dart';

@Entity()
class SystemUserEntity {
  @Id()
  int id;

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? accountType;
  String? role;
  String? status;
  String? createdAt;
  String? profileImageUrl;

  SystemUserEntity({
    this.id = 0,
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.accountType = '',
    this.role = '',
    this.status = '',
    this.createdAt = '',
    this.profileImageUrl = '',
  });

  String get fullName => '$firstName $lastName'.trim();
}
