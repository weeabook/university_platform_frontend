import 'news_entities.dart';

abstract class NewsRepository {
  Future<List<News>> fetchNews();
  Future<News> fetchNewsByID(int newsId);
  Future<List<News>> fetchNewsByCategoryID(int categoryId);
}
