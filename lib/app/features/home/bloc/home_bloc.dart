import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaplication/di/di.dart';
import 'package:myaplication/domain/domain.dart';
part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TopNewsRepository top_news_repository;
  HomeBloc(this.top_news_repository) : super(HomeInitial()) {
    on<HomeLoad>(_homeLoad);
  }
  Future<void> _homeLoad(event, emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final articles = await top_news_repository.getTopNews();
      emit(HomeLoadSuccess(
        articles: articles,
      ));
    } catch (exception, state) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}