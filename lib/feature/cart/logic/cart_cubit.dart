import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:zalada_app/core/db/db_helper/local_db_helper.dart';
import 'package:zalada_app/core/model/product_model_db.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartModelDb> carts = [];

  void loadedCart() {
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

  void clearAllCart() {
    SQLHelper.clearCart().then((_) {
      carts.clear();
      emit(CartNon());
    });
  }

  void addAndRemoveCart(CartModelDb product) {
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

  void increaseQuantity(String productId) async {
    final product = carts.firstWhere((item) => item.id == productId);

    product.quantity += 1;
    await SQLHelper.updateCartItem(product);
    loadedCart();
  }

  void decreaseQuantity(String productId) async {
    final product = carts.firstWhere((item) => item.id == productId);
    if (product.quantity > 1) {
      product.quantity -= 1;
      await SQLHelper.updateCartItem(product);
      loadedCart();
    } else if (product.quantity == 1) {
      await SQLHelper.removeFromCart(productId);
      loadedCart();
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    for (final product in carts) {
      total += (product.price) * (product.quantity);
    }
    return total;
  }

  bool isCart(String productId) {
    return carts.any((item) => item.id == productId);
  }
}
