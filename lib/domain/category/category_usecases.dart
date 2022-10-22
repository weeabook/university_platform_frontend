import 'category_entities.dart';
import 'category_repository.dart';

class FetchCategoryUseCase {
  const FetchCategoryUseCase(this._repository);

  final CategoryRepository _repository;

  Future<List<Category>> exec() async {
    return _repository.fetchCategory();
  }
}
