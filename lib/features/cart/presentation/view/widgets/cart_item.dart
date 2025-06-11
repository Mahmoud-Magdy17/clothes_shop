import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/core/utils/styles.dart';
import 'package:clothes_shop_app/core/widgets/custom_counter.dart';
import 'package:clothes_shop_app/features/cart/data/models/cart_item_model.dart';
import 'package:clothes_shop_app/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:clothes_shop_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItem, this.getElementsAgain});
  final CartItemModel cartItem;
  final Function? getElementsAgain;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late CartItemModel cartItem;
  @override
  void initState() {
    cartItem = widget.cartItem;
    super.initState();
  }

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
                    widget.cartItem.image != null
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
            Expanded(
              child: Padding(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${(cartItem.price! * cartItem.quantity!)}',
                          style: Styles.subTitle2Bold.copyWith(
                            color: kDarkGreyColor,
                          ),
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return CustomCounter(
                              increment: () {
                                setState(() {});
                                context.read<CartCubit>().increment(
                                  productId: cartItem.productId!,
                                );
                                cartItem = cartItem.copyWith(
                                  quantity: cartItem.quantity! + 1,
                                );
                              },
                              decrement: () async {
                                await context.read<CartCubit>().decrement(
                                  productId: cartItem.productId!,
                                );
                                if (cartItem.quantity == 1) {
                                  Fluttertoast.showToast(
                                    msg: "cart item removed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kFontColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  if (widget.getElementsAgain != null) {
                                    widget.getElementsAgain!();
                                  }
                                }
                                setState(() {});
                                cartItem = cartItem.copyWith(
                                  quantity: cartItem.quantity! - 1,
                                );
                              },
                              quantity: cartItem.quantity!,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
