import 'package:objectbox/objectbox.dart';

@Entity()
class LastLoginEntity {
  @Id()
  int id;

  String username;
  bool biometricsEnabled;
  bool notificationsEnabled;

  LastLoginEntity({
    this.id = 0,
    this.username = '',
    this.biometricsEnabled = false,
    this.notificationsEnabled = false,
  });
}