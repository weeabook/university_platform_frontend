import '../../domain/category/category_entities.dart';
import '../../domain/category/category_repository.dart';
import '../datasources/remote_datasource.dart';
import '../models/mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl(this._remote);

  final RemoteDatasource _remote;
  @override
  Future<List<Category>> fetchCategory() async {
    final models = await _remote.fetchCategories();
    return models.map((e) => e.toEntity()).toList();
  }
}
