import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:clothes_shop_app/features/cart/data/repos/card_repo/cart_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImpl repoImpl;
  List<CartItemModel> items = [];
  CartCubit(this.repoImpl) : super(CartInitial());
  Future<void> getAllCardItems() async {
    emit(GetAllCartItemsLoading());
    var result = await repoImpl.getAllCardItems();
    result.fold(
      (fail) {
        emit(GetAllCartItemsFailture(message: fail.message));
      },
      (cartItems) {
        items = cartItems;
        emit(GetAllCartItemsSuccess(items: cartItems));
      },
    );
  }
}
