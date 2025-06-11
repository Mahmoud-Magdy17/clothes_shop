import 'package:clothes_shop_app/features/favorite/data/models/favorite_item.dart';
import 'package:clothes_shop_app/features/favorite/data/repos/favorite_repo/favorite_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepoImpl repoImpl;
  FavoriteCubit({required this.repoImpl}) : super(FavoriteInitial());
  Future<void> getAllFeavorite() async {
    emit(GetFavoriteLoading());
    var result = await repoImpl.getAllFeavorite();
    result.fold(
      (fail) {
        emit(GetFavoriteError(message: fail.message));
      },
      (favorites) {
        emit(GetFavoriteSuccess(items: favorites));
      },
    );
  }
}
