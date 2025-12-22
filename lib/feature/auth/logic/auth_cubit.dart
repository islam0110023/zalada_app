import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/core/network/dio_end_piont.dart';
import 'package:zalada_app/core/network/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isPass = true;

  void obscureText() {
    isPass = !isPass;
    emit(ObscureText());
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode1 = AutovalidateMode.disabled;

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(LoginLoading());
      final Map<String, String> data = {
        'username': emailController.text,
        'password': passwordController.text,
      };
      DioHelper.postData(url: Endpoints.loginEndPoint, data: data).then(
        (value) {
          if (value.statusCode == 201) {
            CacheHelper.saveData(key: 'token', value: value.data['token']);
            emit(LoginLoaded());
          } else {
            emit(LoginFailure(error: 'Login failed , please try again'));
          }
        },
      ).onError(
        (error, stackTrace) {
          emit(LoginFailure(error: 'Login failed , please try again'));
        },
      );
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(AutoValidateMode());
    }
  }

  void register() {
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      emit(RegisterLoading());

      final Map<String, String> data = {
        'username': userNameSignUpController.text,
        'password': passwordSignUpController.text,
        'email': emailSignUpController.text,
      };
      DioHelper.postData(url: Endpoints.signUpEndPoint, data: data).then(
        (value) {
          if (value.statusCode == 201) {
            emit(RegisterLoaded());
          } else {
            emit(RegisterFailure(error: 'Register Error, try again'));
          }
        },
      ).onError(
        (error, stackTrace) {
          emit(RegisterFailure(error: 'Register Error, try again'));
        },
      );
    } else {
      autoValidateMode1 = AutovalidateMode.always;
      emit(AutoValidateModeSignUp());
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    emailController.dispose();
    passwordController.dispose();
    userNameSignUpController.dispose();
    passwordSignUpController.dispose();
    emailSignUpController.dispose();
    return super.close();
  }
}
