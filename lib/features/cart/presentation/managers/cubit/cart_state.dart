part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class GetAllCartItemsLoading extends CartState {}

final class GetAllCartItemsFailture extends CartState {
  final String message;

  const GetAllCartItemsFailture({required this.message});
}

final class GetAllCartItemsSuccess extends CartState {
  final List<CartItemModel> items;

  const GetAllCartItemsSuccess({required this.items});
}
