import '../../domain/auth/auth_entities.dart';

String roleToString(Role role) {
  switch (role) {
    case Role.student:
      return "Студент";
    case Role.teacher:
      return "Преподаватель";
    case Role.employee:
      return "Сотрудник";
    default:
      throw Error();
  }
}

Role stringToRole(String role) {
  switch (role.toLowerCase()) {
    case "студент":
      return Role.student;
    case "преподаватель":
      return Role.teacher;
    case "сотрудник":
      return Role.employee;
    default:
      throw Error();
  }
}
