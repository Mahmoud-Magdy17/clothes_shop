import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:clothes_shop_app/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'cart_item.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  void initState() {
    context.read<CartCubit>().getAllCardItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetAllCartItemsLoading) {
          return Skeletonizer(
            child: ListView.separated(
              itemBuilder:
                  (context, index) => CartItem(
                    cartItem: CartItemModel(
                      image: null,
                      price: 15,
                      material: "",
                      productId: 1,
                      productName: "",
                      quantity: 3,
                      subCategory: "",
                      totalPriceForProduct: 26,
                    ),
                  ),
              separatorBuilder:
                  (context, index) =>
                      Container(color: Colors.transparent, height: 8),
              itemCount: 5,
            ),
          );
        } else if (context.read<CartCubit>().items.isEmpty) {
          return Center(child: Text("No Elemenets on the cart"));
        }
        return ListView.separated(
          itemBuilder:
              (context, index) => CartItem(
                cartItem: context.read<CartCubit>().items[index],
                getElementsAgain: () {
                  context.read<CartCubit>().getAllCardItems();
                },
              ),
          separatorBuilder:
              (context, index) =>
                  Container(color: Colors.transparent, height: 8),
          itemCount: context.read<CartCubit>().items.length,
        );
      },
    );
  }
}
