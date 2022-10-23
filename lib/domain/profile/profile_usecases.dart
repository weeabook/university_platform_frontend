import 'profile_entities.dart';
import 'profile_repository.dart';

class FetchProfileUseCase {
  const FetchProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Profile> exec() async {
    return await _repository.fetchProfile();
  }
}
