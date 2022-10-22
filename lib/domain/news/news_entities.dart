class News {
  const News({
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
}
