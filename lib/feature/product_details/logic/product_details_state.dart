part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class FavoriteLoaded extends ProductDetailsState {}
final class FavoriteLoading extends ProductDetailsState {}
final class FavoriteNon extends ProductDetailsState {}
