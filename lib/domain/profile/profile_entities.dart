class Profile {
  const Profile({
    required this.name,
    required this.surname,
    required this.patronymic,
    this.avatarUrl,
    this.recordbook,
    required this.role,
    required this.group,
    required this.email,
  });

  final String name;
  final String surname;
  final String? patronymic;
  final String? avatarUrl;
  final String? recordbook;
  final String role;
  final String group;
  final String email;
}
