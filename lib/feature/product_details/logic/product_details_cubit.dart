import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zalada_app/core/db/db_helper/local_db_helper.dart';
import 'package:zalada_app/core/model/favorite_model_db.dart';
import 'package:zalada_app/core/model/product_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
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
