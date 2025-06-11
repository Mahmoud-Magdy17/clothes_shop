import 'package:clothes_shop_app/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          itemBuilder:
              (context, index) =>
                  CartItem(cartItem: context.read<CartCubit>().items[index]),
          separatorBuilder:
              (context, index) =>
                  Container(color: Colors.transparent, height: 8),
          itemCount: context.read<CartCubit>().items.length,
        );
      },
    );
  }
}
