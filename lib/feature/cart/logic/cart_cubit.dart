import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/db_helper/local_db_helper.dart';
import '../../../core/model/product_model.dart';
import '../../../core/model/product_model_db.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Product> carts = [];

  loadedCart() {
    emit(CartLoading());
    SQLHelper.getCart().then(
          (value) {
        carts = value;
        if (carts.isNotEmpty) {
          emit(CartLoaded());
        } else {
          emit(CartNon());
        }
      },
    );
  }

  addAndRemoveCart(CartModelDb product) {
    if (isCart(product.id.toString())) {
      SQLHelper.removeFromCart(product.id.toString()).then(
            (value) {
          carts.removeWhere((item) => item.id == product.id);
        },
      );
    } else {
      SQLHelper.addToCart(product).then(
            (value) {
          carts.add(product);
        },
      );
    }
    loadedCart();
  }

  bool isCart(String productId) {
    return carts.any((item) => item.id == productId);
  }
}
