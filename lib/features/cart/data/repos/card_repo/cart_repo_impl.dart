
import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/core/api/dio_consumer.dart';
import 'package:clothes_shop_app/core/api/end_point.dart';
import 'package:clothes_shop_app/core/error/failures.dart';
import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:clothes_shop_app/features/cart/data/repos/card_repo/card_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl implements CardRepo {
  final DioConsumer dioConsumer;

  CartRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, int>> decrement({required int productId}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> getAllCardItems() async {
    try {
      var response = await dioConsumer.get(
        "${EndPoint.baseUrl}Cart/GetallProductFromCart",
      );
      List<CartItemModel> cartItems = [];
      for (var cartItem in response["items"]) {
        cartItems.add(CartItemModel.fromJson(cartItem));
      }
      return Right(cartItems);
    } catch (e) {
      logger.e("Exception in  categoryHomeRepoImpl :$e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> increment({required int productId}) {
    // TODO: implement increment
    throw UnimplementedError();
  }
}
