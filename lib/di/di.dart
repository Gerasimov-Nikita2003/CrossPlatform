import 'package:myaplication/app/features/auth/bloc/auth_bloc.dart';
import 'package:myaplication/app/features/favourites/bloc/favourites_bloc.dart';
import 'package:myaplication/domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:myaplication/domain/repository/favourites/favourites_repository.dart';
import 'package:myaplication/domain/services/auth/auth_services.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:myaplication/data/data.dart';
import 'package:myaplication/app/app.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();

Future<void> setupLocator() async {
  setUpDio();
  getIt.registerSingleton<Dio>(dio);
  //getIt.registerSingleton<Talker>(talker);
  getIt.registerSingleton(TopNewsRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(HomeBloc(getIt.get<TopNewsRepository>()));
  
  getIt.registerSingleton(CharacterRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(InfoBloc(getIt.get<CharacterRepository>()));

  getIt.registerSingleton(AuthService(dio:getIt<Dio>()));
  getIt.registerSingleton(AuthBloc(getIt.get<AuthService>()));
  
  getIt.registerSingleton(FavouritesService(dio:getIt<Dio>()));
  getIt.registerSingleton(FavouritesBloc(getIt.get<FavouritesService>()));
  
  getIt.registerSingleton(talker);
}
