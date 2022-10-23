import '../../domain/profile/profile_entities.dart';
import '../../domain/profile/profile_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/mappers/profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._local, this._remote);

  final LocalDatasource _local;
  final RemoteDatasource _remote;

  @override
  Future<Profile> fetchProfile() async {
    final token = await _local.getAuthToken();
    final profile = await _remote.fetchProfile(token!);
    return profile.toEntity();
  }
}
