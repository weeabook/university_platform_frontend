import 'appeal_entities.dart';
import 'appeal_repository.dart';

class CreateUseCase {
  const CreateUseCase(this._repository);

  final AppealRepository _repository;

  Future<void> exec(Appeal appeal) async {
    return await _repository.create(appeal);
  }
}
