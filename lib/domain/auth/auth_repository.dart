import 'auth_entities.dart';

abstract class AuthRepository {
  Future<bool> isAuthorized();

  Future<void> signIn(String email, String password);
  Future<void> signUp(AuthUserDto dto);

  Future<void> signOut();
}
