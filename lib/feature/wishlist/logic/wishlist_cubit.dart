import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/db_helper/local_db_helper.dart';
import '../../../core/model/favorite_model_db.dart';
import '../../../core/model/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  List<Product> favorites = [];


  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    favorites = await SQLHelper.getFavorites();

    if (favorites.isNotEmpty) {
      emit(FavoriteLoaded());
    } else {
      emit(FavoriteNon());
    }
  }

  Future<void> addAndRemoveFavorite(FavoriteModelDb product) async {
    if (isFavorite(product.id.toString())) {
      await SQLHelper.removeFromFavorites(product.id.toString());
      favorites.removeWhere((item) => item.id == product.id);
    } else {
      await SQLHelper.addToFavorites(product);
      favorites.add(product);
    }
    loadFavorites();
  }

  bool isFavorite(String productId) {
    return favorites.any((item) => item.id == productId);
  }

}
