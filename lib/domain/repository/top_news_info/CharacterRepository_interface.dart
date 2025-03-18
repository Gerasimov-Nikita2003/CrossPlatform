import 'dart:async';
import 'package:myaplication/domain/domain.dart';

abstract class CharacterRepositoryInterface {
  Future<Article> ChGetById();
}
