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
}
