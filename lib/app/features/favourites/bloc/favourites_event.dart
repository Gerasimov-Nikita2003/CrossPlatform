part of "favourites_bloc.dart";

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();
  @override
  List<Object?> get props => [];
}

class FavouritesGet extends FavouritesEvent {}

class FavouritesAdd extends FavouritesEvent {
  final int id;
  final String name;
  final String release;
  final String imdbRating;
  final String timing;
  final String description;

  const FavouritesAdd({
    required this.id,
    required this.name,
    required this.release,
    required this.imdbRating,
    required this.timing,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [id, name, release, imdbRating, timing, description];
}

class FavouritesDelete extends FavouritesEvent {
  final String name;
  const FavouritesDelete(this.name);

  @override
  List<Object?> get props => [name];
}

class CheckFavoriteEvent extends FavouritesEvent {
  final int id;

  const CheckFavoriteEvent(this.id);
}
