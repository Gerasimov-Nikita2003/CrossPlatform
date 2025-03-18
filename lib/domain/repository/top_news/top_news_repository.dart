import 'dart:async';
import 'package:dio/dio.dart';
import 'package:myaplication/data/data.dart';
import 'package:myaplication/domain/domain.dart';

// class TopNewsRepository extends TopNewsRepositoryInterface {
//   TopNewsRepository({required this.dio});
//   final Dio dio;
//   @override
//   Future<List<Article>> getTopNews() async {
//     try {
//       final Response response = await dio.get(
//         Endpoints.motorcycle,
//         queryParameters: {
//           'pageNo': '1',
//           //'movies': '',
//           //'make': 'Ducati',
//           // 'model': '',
//           // 'type': '',
//           // 'year': '',
//         },
//       );
//       final motorcycles =
//           (response.data as List).map((e) => Article.fromJson(e)).toList();
//       return motorcycles;
//     } on DioException catch (e) {
//       throw e.message.toString();
//     }
//   }
// }
class TopNewsRepository extends TopNewsRepositoryInterface {
  TopNewsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<Article>> getTopNews() async {
    try {
      final Response response = await dio.get(
        Endpoints.motorcycle,
        queryParameters: {
          'pageNo': '1',
        },
      );
      final articles =
          (response.data as List).map((e) => Article.fromJson(e)).toList();
      return articles;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
