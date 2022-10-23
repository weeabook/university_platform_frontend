import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  const NewsModel({
    required this.id,
    required this.title,
    this.imgUrl,
    required this.content,
    required this.category,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String? imgUrl;
  final String content;
  final String category;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imgUrl': imgUrl,
      'content': content,
      'category': category,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
      content: map['content'] as String,
      category: map['category'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }
  @override
  List<Object?> get props => [
        id,
        title,
        imgUrl,
        content,
        category,
        createdAt,
      ];
}
