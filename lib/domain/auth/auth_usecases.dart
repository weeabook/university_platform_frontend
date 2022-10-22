import 'auth_entities.dart';
import 'auth_repository.dart';

class IsAuthorizedUseCase {
  const IsAuthorizedUseCase(this._repository);

  final AuthRepository _repository;

  bool exec() => _repository.isAuthorized();
}

class SignInUseCase {
  const SignInUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> exec(String email, String password) async {
    return await _repository.signIn(email, password);
  }
}

class SignUpUseCase {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> exec(AuthUserDto dto) async {
    return await _repository.signUp(dto);
  }
}
