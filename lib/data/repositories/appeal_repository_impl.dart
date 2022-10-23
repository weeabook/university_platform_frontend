import '../../domain/appeal/appeal_entities.dart';
import '../../domain/appeal/appeal_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/mappers/appeal_mapper.dart';

class AppealRepositoryImpl implements AppealRepository {
  const AppealRepositoryImpl(this._local, this._remote);

  final LocalDatasource _local;
  final RemoteDatasource _remote;

  @override
  Future<void> create(Appeal appeal) async {
    final token = await _local.getAuthToken();
    if (token == null) return;
    return await _remote.createAppeal(token, appeal.toModel());
  }
}
