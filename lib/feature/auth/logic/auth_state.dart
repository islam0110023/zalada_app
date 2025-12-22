part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class ObscureText extends AuthState {}

final class LoginLoading extends AuthState{}
final class LoginLoaded extends AuthState{}
final class LoginFailure extends AuthState{
  LoginFailure({required this.error});
  final String error;
}

final class RegisterLoading extends AuthState{}
final class RegisterLoaded extends AuthState{}
final class RegisterFailure extends AuthState{
  RegisterFailure({required this.error});
  final String error;
}
final class AutoValidateMode extends AuthState{}
final class AutoValidateModeSignUp extends AuthState{}

