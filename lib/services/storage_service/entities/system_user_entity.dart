import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class SystemUserEntity {
  @Id()
  int id;

  String? name;
  String? fullName;
  String? email;
  String? gender;
  String? locale;
  String? avatarRef;
  String? avatarType;
  String? preferencesString;
  bool? emailVerified;

  SystemUserEntity({
    this.id = 0,
    this.name = '',
    this.fullName = '',
    this.email = '',
    this.gender = '',
    this.locale = '',
    this.avatarRef = '',
    this.avatarType = '',
    this.preferencesString = '',
    this.emailVerified = false,
  });

  List<String> get preferences => (json.decode(preferencesString ?? '') as List).map((p) => p.toString()).toList();
}