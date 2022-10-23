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
  Future<String> signUp(AuthUserDto dto);

  Future<void> createAppeal(AppealModel appeal);

  Future<List<CategoryModel>> fetchCategories();

  Future<List<NewsModel>> fetchNews();
  Future<NewsModel> fetchNewsByID(int newsId);
  Future<List<NewsModel>> fetchNewsByCategoryID(int categoryId);

  Future<ProfileModel> fetchProfile();
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
  Future<String> signUp(AuthUserDto dto) async {
    await _client.post(
      _uriResolver.uri('${Urls.pahtToServer}/sign-up'),
      body: dto.toJson(),
    );

    return await signIn(dto.email, dto.password);
  }

  @override
  Future<void> createAppeal(AppealModel appeal) async {}

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    throw Error();
  }

  @override
  Future<List<NewsModel>> fetchNews() async {
    throw Error();
  }

  @override
  Future<NewsModel> fetchNewsByID(int newsId) async {
    throw Error();
  }

  @override
  Future<List<NewsModel>> fetchNewsByCategoryID(int categoryId) async {
    throw Error();
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    throw Error();
  }
}
