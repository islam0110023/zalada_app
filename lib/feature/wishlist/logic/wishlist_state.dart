part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}
final class LoadedFavorite extends WishlistState {}
final class LoadingFavorite extends WishlistState {}
final class NoFavorite extends WishlistState {}
