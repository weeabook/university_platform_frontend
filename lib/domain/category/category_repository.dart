import 'category_entities.dart';

abstract class CategoryRepository {
  Future<List<Category>> fetchCategory();
}
