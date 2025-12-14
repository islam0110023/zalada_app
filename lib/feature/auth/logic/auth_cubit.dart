import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/core/network/dio_end_piont.dart';
import 'package:zalada_app/core/network/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isPass = true;

  obscureText() {
    isPass = !isPass;
    emit(ObscureText());
  }



  login({required String userName, required String password}) async {
    Map<String, String> data = {'username': userName, 'password': password};
    emit(LoginLoading());
    DioHelper.postData(url: Endpoints.loginEndPoint, data: data).then(
      (value) {
        if (value.statusCode == 201) {
          CacheHelper.saveData(key: "token", value: value.data["token"]);
          emit(LoginLoaded());
        } else {
          emit(LoginFailure(error: "Login failed , please try again"));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(LoginFailure(error: "Login failed , please try again"));
      },
    );
  }

  register(
      {required String userName,
      required String password,
      required String email}) {
    Map<String, String> data = {
      "username": userName,
      "password": password,
      "email": email
    };
    emit(RegisterLoading());
    DioHelper.postData(url: Endpoints.signUpEndPoint, data: data).then(
      (value) {
        if (value.statusCode == 201) {
          emit(RegisterLoaded());
        } else {
          emit(RegisterFailure(error: "Register Error, try again"));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(RegisterFailure(error: "Register Error, try again"));
      },
    );
  }
}
