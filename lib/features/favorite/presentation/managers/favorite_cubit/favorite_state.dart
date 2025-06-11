part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoriteLoading extends FavoriteState {}

final class GetFavoriteError extends FavoriteState {
  final String message;

  const GetFavoriteError({required this.message});
}

final class GetFavoriteSuccess extends FavoriteState {
  final List<FavoriteItem> items;

  const GetFavoriteSuccess({required this.items});
}
