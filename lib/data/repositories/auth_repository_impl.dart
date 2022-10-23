import 'package:university_platform_frontend/domain/auth/auth_entities.dart';

import '../../domain/auth/auth_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._local, this._remote);

  final LocalDatasource _local;
  final RemoteDatasource _remote;

  @override
  Future<bool> isAuthorized() async {
    if (await _local.getAuthToken() == null) {
      return false;
    }

    return true;
  }

  @override
  Future<void> signIn(String email, String password) async {
    final token = await _remote.signIn(email, password);
    return await _local.contributeAuthToken(token);
  }

  @override
  Future<void> signUp(AuthUserDto dto) async {
    await _remote.signUp(dto);
    final token = await _remote.signIn(dto.email, dto.password);
    return await _local.contributeAuthToken(token);
  }

  @override
  Future<void> signOut() async {
    return await _local.deleteAuthToken();
  }
}
