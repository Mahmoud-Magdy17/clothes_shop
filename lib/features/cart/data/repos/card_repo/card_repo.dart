import 'package:clothes_shop_app/core/error/failures.dart';
import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  Future<Either<Failure, List<CartItemModel>>> getAllCardItems();

  Future<Either<Failure, int>> increment({required int productId});
  Future<Either<Failure, int>> decrement({required int productId});
}
