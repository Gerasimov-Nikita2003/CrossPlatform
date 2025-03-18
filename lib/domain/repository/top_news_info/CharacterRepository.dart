import 'dart:async';
import 'package:dio/dio.dart';
import 'package:myaplication/data/data.dart';
import 'package:myaplication/domain/domain.dart';

class CharacterRepository extends CharacterRepositoryInterface {
  CharacterRepository({required this.dio});
  final Dio dio;
  @override
  Future<Article> ChGetById() async {
    try {
      final Response response = await dio.get(
        Endpoints.getById,
      );

      List<String> parts = Endpoints.getById.split('/');
      String id = parts.last;
      Endpoints.getById = Endpoints.getById.replaceAll(id, 'id');

      final motorcycles = Article.fromJson(response.data);
      return motorcycles;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
