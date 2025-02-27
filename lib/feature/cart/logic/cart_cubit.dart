import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/db_helper/local_db_helper.dart';
import '../../../core/model/product_model.dart';
import '../../../core/model/product_model_db.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartModelDb> carts = [];

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
  void clearAllCart() {
    SQLHelper.clearCart().then((_) {
      carts.clear();
      emit(CartNon());
    });
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

  increaseQuantity(String productId) async {
    final product =
        carts.firstWhere((item) => item.id == productId) as CartModelDb;

    product.quantity += 1;
    await SQLHelper.updateCartItem(product);
    loadedCart();
  }

  decreaseQuantity(String productId) async {
    final product =
        carts.firstWhere((item) => item.id == productId) as CartModelDb;
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
    for (var product in carts) {
      total += (product.price ?? 0) * (product.quantity ?? 1);
    }
    return total;
  }




  bool isCart(String productId) {
    return carts.any((item) => item.id == productId);
  }
}
