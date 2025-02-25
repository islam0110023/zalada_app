part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeProductLoading extends HomeState {}
final class HomeProductLoaded extends HomeState {}
final class HomeProductFailure extends HomeState {
  final String error;
  HomeProductFailure({required this.error});
}
