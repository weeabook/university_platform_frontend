import 'dart:convert';

import '../../domain/auth/auth_entities.dart';
import '../client/http_client.dart';
import '../client/uri_resolver.dart';
import '../client/urls.dart';
import '../models/appeal_model.dart';
import '../models/category_model.dart';
import '../models/news_model.dart';
import '../models/profiile_model.dart';

abstract class RemoteDatasource {
  Future<String> signIn(String email, String password);
  Future<void> signUp(AuthUserDto dto);

  Future<void> createAppeal(String token, AppealModel appeal);

  Future<List<CategoryModel>> fetchCategories();

  Future<List<NewsModel>> fetchNews();
  Future<NewsModel> fetchNewsByID(int newsId);
  Future<List<NewsModel>> fetchNewsByCategoryID(int categoryId);

  Future<ProfileModel> fetchProfile(String token);

  Future<void> downloadTimetable(String token, int groupId);
}

class RemoteDatasourceImpl implements RemoteDatasource {
  const RemoteDatasourceImpl(this._client, this._uriResolver);

  final HttpClient _client;
  final UriResolver _uriResolver;

  @override
  Future<String> signIn(String email, String password) async {
    final res = await _client.post(
      _uriResolver.uri('${Urls.pahtToServer}/sign-in'),
      body: jsonEncode({'email': email, 'password': password}),
    );

    return jsonDecode(res.body)['token'];
  }

  @override
  Future<void> signUp(AuthUserDto dto) async {
    await _client.post(
      _uriResolver.uri('${Urls.pahtToServer}/sign-up'),
      body: dto.toJson(),
    );
  }

  @override
  Future<void> createAppeal(String token, AppealModel appeal) async {
    final res = await _client.post(
      _uriResolver.uri('${Urls.pahtToServer}/rector-appeal'),
      headers: {'Authorization': token},
      body: appeal.toJson(),
    );

    return;
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final List<CategoryModel> categories = [];
    categories.addAll([
      const CategoryModel(id: 1, name: 'Университет'),
      const CategoryModel(id: 2, name: 'Профсоюз'),
      const CategoryModel(id: 3, name: 'Студсовет'),
      const CategoryModel(id: 4, name: 'Общежития'),
    ]);

    return categories;
  }

  @override
  Future<List<NewsModel>> fetchNews() async {
    final res = await _client.get(
      _uriResolver.uri('${Urls.pahtToServer}/news/'),
    );

    final json = jsonDecode(res.body) as List<Map<String, dynamic>>;

    return json.map((e) => NewsModel.fromMap(e)).toList();
  }

  @override
  Future<NewsModel> fetchNewsByID(int newsId) async {
    final res = await _client.get(
      _uriResolver.uri('${Urls.pahtToServer}/news', [
        QueryParam(key: 'id', value: '$newsId'),
      ]),
    );

    return NewsModel.fromMap(jsonDecode(res.body));
  }

  @override
  Future<List<NewsModel>> fetchNewsByCategoryID(int categoryId) async {
    final res = await _client.get(
      _uriResolver.uri('${Urls.pahtToServer}/news', [
        QueryParam(key: 'category', value: '$categoryId'),
      ]),
    );
    final json = jsonDecode(res.body) as List<Map<String, dynamic>>;

    return json.map((e) => NewsModel.fromMap(e)).toList();
  }

  @override
  Future<ProfileModel> fetchProfile(String token) async {
    final res = await _client.get(
      _uriResolver.uri('${Urls.pahtToServer}/profile'),
    );

    return ProfileModel.fromJson(res.body);
  }

  @override
  Future<void> downloadTimetable(String token, int groupId) async {}
}
