// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  const ProfileModel({
    required this.name,
    required this.surname,
    required this.patronymic,
    this.avatarUrl,
    this.recordbook,
    required this.role,
    required this.groupId,
    required this.groupName,
    required this.email,
  });

  final String name;
  final String surname;
  final String? patronymic;
  final String? avatarUrl;
  final String? recordbook;
  final String role;
  final int groupId;
  final String groupName;
  final String email;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'avatarUrl': avatarUrl,
      'recordbook': recordbook,
      'role': role,
      'group_id': groupId,
      'group_name': groupName,
      'email': email,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      surname: map['surname'] as String,
      patronymic:
          map['patronymic'] != null ? map['patronymic'] as String : null,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
      recordbook:
          map['recordbook'] != null ? map['recordbook'] as String : null,
      role: map['role'] as String,
      groupId: map['group_id'] as int,
      groupName: map['group_name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
