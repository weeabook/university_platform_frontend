import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppealModel extends Equatable {
  const AppealModel({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'AppealModel(title: $title, content: $content)';

  @override
  List<Object> get props => [title, content];
}
