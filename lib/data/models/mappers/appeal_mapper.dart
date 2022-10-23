import 'package:university_platform_frontend/data/models/appeal_model.dart';
import 'package:university_platform_frontend/domain/appeal/appeal_entities.dart';

extension AppealMapper on Appeal {
  AppealModel toModel() {
    return AppealModel(title: title, content: content);
  }
}
