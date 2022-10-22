import 'appeal_entities.dart';

abstract class AppealRepository {
  Future<void> create(Appeal appeal);
}
