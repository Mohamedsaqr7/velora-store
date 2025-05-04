import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/customer/favourite/data/favourites_model.dart';

import '../../../../core/services/hive/hive_database.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesState.initial());
  
  Future<void> manageFavourites({
    required String productId,
    required String title,
    required String image,
    required String price,
    required String categoryName,
  }) async {
    emit( FavouritesState.initial());
    final existingIndex = HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .indexWhere((e) => e.id == productId);

    if (existingIndex >= 0) {
      await HiveDatabase().favoritesBox!.deleteAt(existingIndex);
    } else {
      await HiveDatabase().favoritesBox!.add(
            FavoritesModel(
              id: productId,
              title: title,
              image: image,
              price: price,
              categoryName: categoryName,
            ),
          );
    }
    emit(const FavouritesState.addAndRemoveFavorites());
  }

  bool isFavorites(String productId) {
    return HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .any((e) => e.id == productId);
  }

  List<FavoritesModel> get favoritesLis {
    return HiveDatabase().favoritesBox!.values.toList();
  }
}
