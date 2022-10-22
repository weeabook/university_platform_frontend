import 'profile_entities.dart';
import 'progile_repository.dart';

class FetchProfileUseCase {
  const FetchProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Profile> exec() async {
    return await _repository.fetchProfile();
  }
}
