import '../../../domain/news/news_entities.dart';
import '../news_model.dart';

extension NewsMapper on NewsModel {
  News toEntity() {
    return News(
      id: id,
      title: title,
      content: content,
      category: category,
      createdAt: createdAt,
    );
  }
}
