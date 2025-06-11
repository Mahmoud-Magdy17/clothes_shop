import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/core/utils/styles.dart';
import 'package:clothes_shop_app/core/widgets/custom_counter.dart';
import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:clothes_shop_app/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:clothes_shop_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: kLightGreyColor,
            foregroundColor: Colors.red,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            spacing: 40,
            flex: 1,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kWhiteColor,
          border: Border.all(color: kLightGreyColor),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    cartItem.image != null
                        ? Image.network(
                          cartItem.image!,
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                        )
                        : Image.asset(
                          Assets.imagesProducteDetailsTest,
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                        ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    cartItem.productName ?? "no name",
                    style: Styles.subTitle1Bold,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cartItem.subCategory ?? "no cat",
                    style: Styles.caption2Regular.copyWith(color: kGreyColor),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${cartItem.totalPriceForProduct}',
                        style: Styles.subTitle2Bold.copyWith(
                          color: kDarkGreyColor,
                        ),
                      ),
                      const SizedBox(width: 48),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return CustomCounter(
                            increment: () {},
                            decrement: () {},
                            quantity: 3,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.arrow_back_ios_rounded)],
            ),
          ],
        ),
      ),
    );
  }
}
