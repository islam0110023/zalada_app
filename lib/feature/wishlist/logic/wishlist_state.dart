part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}
final class FavoriteLoaded extends WishlistState {}
final class FavoriteLoading extends WishlistState {}
final class FavoriteNon extends WishlistState {}