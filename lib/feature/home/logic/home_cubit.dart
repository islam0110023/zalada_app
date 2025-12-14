import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/core/model/product_model.dart';
import 'package:zalada_app/core/network/dio_end_piont.dart';
import 'package:zalada_app/core/network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Product> products = [];

  void getProducts() async {
    emit(HomeProductLoading());
    DioHelper.getData(url: Endpoints.productsEndpoint).then(
      (value) {
        if (value.statusCode == 200 && value.data != null) {
          products = (value.data as List)
              .map(
                (e) => ProductModel.fromJson(e),
              )
              .toList();
          emit(HomeProductLoaded());
        } else {
          emit(HomeProductFailure(error: 'Error ,Try again'));
        }
      },
    ).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
        emit(HomeProductFailure(error: 'Error ,Try again'));
      },
    );
  }
}
