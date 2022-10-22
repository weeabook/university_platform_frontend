import 'news_entities.dart';
import 'news_repository.dart';

class FetchNewsUseCase {
  const FetchNewsUseCase(this._repository);

  final NewsRepository _repository;

  Future<List<News>> exec() async {
    return await _repository.fetchNews();
  }
}

class FetchNewsByIDUseCase {
  const FetchNewsByIDUseCase(this._repository);

  final NewsRepository _repository;

  Future<News> exec(int id) async {
    return await _repository.fetchNewsByID(id);
  }
}

class FetchNewsByCategoryIDUseCase {
  const FetchNewsByCategoryIDUseCase(this._repository);

  final NewsRepository _repository;

  Future<List<News>> exec(int categoryId) async {
    return await _repository.fetchNewsByCategoryID(categoryId);
  }
}
