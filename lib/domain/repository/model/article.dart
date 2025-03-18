import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.id,
    required this.name,
    required this.release,
    required this.imdbRating,
    required this.timing,
    required this.description,
  });

  final int id;
  final String name;
  final String release;
  final String imdbRating;
  final String timing;
  final String description;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
