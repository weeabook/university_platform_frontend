import 'package:localstorage/localstorage.dart';

abstract class LocalDatasource {
  Future<void> contributeAuthToken(String token);
  Future<String> getAuthToken();
  Future<void> deleteAuthToken();
}

class LocalDatasourceImpl implements LocalDatasource {
  const LocalDatasourceImpl(this._db);

  final LocalStorage _db;

  @override
  Future<void> contributeAuthToken(String token) async {
    return await _db.setItem('token', token);
  }

  @override
  Future<String> getAuthToken() async {
    return await _db.getItem('token');
  }

  @override
  Future<void> deleteAuthToken() async {
    return await _db.clear();
  }
}
