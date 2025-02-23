part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class ObscureText extends AuthState {}

final class LoginLoading extends AuthState{}
final class LoginLoaded extends AuthState{}
final class LoginFailure extends AuthState{
  final String error;
  LoginFailure({required this.error});
}

final class RegisterLoading extends AuthState{}
final class RegisterLoaded extends AuthState{}
final class RegisterFailure extends AuthState{
  final String error;
  RegisterFailure({required this.error});
}
