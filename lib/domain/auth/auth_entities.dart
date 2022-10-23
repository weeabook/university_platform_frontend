import 'dart:convert';

import '../../data/utils/enum_parse.dart' as helpers;

enum Role { student, teacher, employee }

class AuthUserDto {
  const AuthUserDto({
    required this.name,
    required this.surname,
    this.patronymic,
    required this.role,
    required this.email,
    required this.password,
  });

  final String name;
  final String surname;
  final String? patronymic;
  final Role role;
  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'role': helpers.roleToString(role),
      'email': email,
      'password': password,
    };
  }

  factory AuthUserDto.fromMap(Map<String, dynamic> map) {
    return AuthUserDto(
      name: map['name'] as String,
      surname: map['surname'] as String,
      patronymic:
          map['patronymic'] != null ? map['patronymic'] as String : null,
      role: helpers.stringToRole(map['role'] as String),
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUserDto.fromJson(String source) =>
      AuthUserDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
