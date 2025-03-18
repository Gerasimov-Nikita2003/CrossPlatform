import 'dart:async';
import 'package:myaplication/domain/domain.dart';

abstract class TopNewsRepositoryInterface {
Future<List<Article>> getTopNews();
}