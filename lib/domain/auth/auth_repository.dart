import 'auth_entities.dart';

abstract class AuthRepository {
  bool isAuthorized();

  Future<void> signIn(String email, String password);
  Future<void> signUp(AuthUserDto dto);
}
