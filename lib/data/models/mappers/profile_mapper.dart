import '../../../domain/profile/profile_entities.dart';
import '../profiile_model.dart';

extension ProfileMapper on ProfileModel {
  Profile toEntity() {
    return Profile(
      name: name,
      surname: surname,
      patronymic: patronymic,
      role: role,
      groupId: groupId,
      groupName: groupName,
      email: email,
    );
  }
}
