import 'package:clothes_shop_app/core/error/failures.dart';
import 'package:clothes_shop_app/features/favorite/data/models/favorite_item.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<FavoriteItem>>> getAllFeavorite();
}
