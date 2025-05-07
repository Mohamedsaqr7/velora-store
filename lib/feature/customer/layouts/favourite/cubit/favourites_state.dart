part of 'favourites_cubit.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.initial() = _Initial;
   const factory FavouritesState.addAndRemoveFavorites() =
      AddAndRemoveFavoritesState;
}
