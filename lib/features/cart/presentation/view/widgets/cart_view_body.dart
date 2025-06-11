
import 'package:flutter/material.dart';

import 'cart_list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CartListView(),
    );
  }
}
