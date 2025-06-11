import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/core/api/dio_consumer.dart';
import 'package:clothes_shop_app/core/api/end_point.dart';
import 'package:clothes_shop_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../models/favorite_item.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final DioConsumer dioConsumer;

  FavoriteRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, List<FavoriteItem>>> getAllFeavorite() async {
    try {
      var response =
          await dioConsumer.get("${EndPoint.baseUrl}Favorite/GetAllFavorite")
              as List<dynamic>;
      List<FavoriteItem> favoriteItems = [];
      for (var favoriteItem in response) {
        favoriteItems.add(FavoriteItem.fromJson(favoriteItem));
      }
      return Right(favoriteItems);
    } catch (e) {
      logger.e("Exception in  categoryHomeRepoImpl :$e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
