// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article1 _$ArticleFromJson(Map<String, dynamic> json) => Article1(
      id: json['id'] as int,
      name: json['name'] as String,
      release: json['release'] as String,
      imdbRating: json['imdbRating'] as String,
      timing: json['timing'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article1 instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'release': instance.release,
      'imdbRating': instance.imdbRating,
      'timing': instance.timing,
      'description': instance.description,
    };
