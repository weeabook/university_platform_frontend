import '../../domain/news/news_entities.dart';
import '../../domain/news/news_repository.dart';
import '../datasources/remote_datasource.dart';
import '../models/mappers/news_mapper.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl(this._remote);

  final RemoteDatasource _remote;

  @override
  Future<List<News>> fetchNews() async {
    final news = await _remote.fetchNews();
    return news.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<News>> fetchNewsByCategoryID(int categoryId) async {
    final news = await _remote.fetchNewsByCategoryID(categoryId);
    return news.map((e) => e.toEntity()).toList();
  }

  @override
  Future<News> fetchNewsByID(int newsId) async {
    final news = await _remote.fetchNewsByID(newsId);
    return news.toEntity();
  }
}
