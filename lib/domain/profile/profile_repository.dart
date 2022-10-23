import 'profile_entities.dart';

abstract class ProfileRepository {
  Future<Profile> fetchProfile();
}
