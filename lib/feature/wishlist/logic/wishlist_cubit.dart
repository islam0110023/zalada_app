import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zalada_app/core/db/db_helper/local_db_helper.dart';
import 'package:zalada_app/core/model/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  List<Product> favorites = [];
  Future<void> loadFavorites() async {
    emit(LoadingFavorite());
    favorites = await SQLHelper.getFavorites();
    if (favorites.isNotEmpty) {
      emit(LoadedFavorite());

    }  
    else{
      emit(NoFavorite());
    }
  }
}
