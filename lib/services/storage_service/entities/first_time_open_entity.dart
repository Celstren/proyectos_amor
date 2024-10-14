import 'package:objectbox/objectbox.dart';

@Entity()
class FirstTimeOpenEntity {
  @Id()
  int id;

  String username;

  FirstTimeOpenEntity({
    this.id = 0,
    this.username = '',
  });
}