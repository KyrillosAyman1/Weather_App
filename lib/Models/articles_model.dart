class ArticleModel {
  final String? image;
  final String title;
  final String? subtitle;
  final DateTime published;
  final String? source;
  final String content;
  final String url;
  bool isFavorite;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.published,
    required this.source,
    required this.content,
    required this.url,

    this.isFavorite = false,
  });

  factory ArticleModel.fromjson(json) {
    return ArticleModel(
      image: json["image"],
      title: json["title"],
      subtitle: json["description"],
      published: DateTime.parse(json["publishedAt"]) ,
      source: json["source"]["name"],
      content: json["content"],
      url: json["url"],
    );
  }
}
