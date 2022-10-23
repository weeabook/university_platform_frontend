import '../../../domain/category/category_entities.dart';
import '../category_model.dart';

extension CategoryMapper on CategoryModel {
  Category toEntity() {
    return Category(id: id, name: name);
  }
}
