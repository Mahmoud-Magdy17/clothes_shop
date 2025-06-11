import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/core/utils/styles.dart';
import 'package:clothes_shop_app/core/widgets/custom_button.dart';
import 'package:clothes_shop_app/core/widgets/custom_counter.dart';
import 'package:clothes_shop_app/core/widgets/custom_list_of_color.dart';
import 'package:clothes_shop_app/core/widgets/custom_size.dart';
import 'package:clothes_shop_app/features/home/domain/entities/product_entity.dart';
import 'package:clothes_shop_app/features/home/presentation/manage/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.productDetails});

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = context.read<ProductCubit>();

    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetails.name,
                      style: Styles.subTitle1Bold.copyWith(
                        color: kDarkGreyColor,
                      ),
                    ),
                    Text(
                      productDetails.material,
                      style: Styles.caption1Regular.copyWith(color: kGreyColor),
                    ),
                  ],
                ),
                CustomCounter(
                  decrement: () {
                    if (cubit.quantity > 0) {
                      cubit.quantity--;
                    }
                  },
                  increment: () {
                    if (cubit.quantity < 10) {
                      cubit.quantity++;
                    }
                  },
                  quantity: cubit.quantity,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizeOfProduct(),
                CustomListOfColor(
                  colors: [
                    Colors.red,
                    Colors.black,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              productDetails.description,
              style: Styles.subTitle1Bold.copyWith(color: kDarkGreyColor),
            ),
            Text(
              productDetails.description,
              style: Styles.textButton.copyWith(color: kGreyColor),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Price',
                      style: Styles.caption2Regular.copyWith(color: kGreyColor),
                    ),
                    Text(
                      productDetails.price.toString(),
                      style: Styles.subTitle2Bold.copyWith(
                        color: kDarkGreyColor,
                      ),
                    ),
                  ],
                ),
                BlocConsumer<ProductCubit, ProductState>(
                  listener: (BuildContext context, ProductState state) {
                    if (state is AddProductToCardSuccess) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: "Item added to cart successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kFontColor,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddProductToCardLoading) {
                      return AbsorbPointer(
                        child: SecondCustomButton(
                          isMinWidth: true,
                          onPressed: () {},
                          title: 'Adding',
                          child: const CircularProgressIndicator(
                            color: (Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return SecondCustomButton(
                        isMinWidth: true,
                        onPressed: () {
                          context.read<ProductCubit>().addProductToCard(
                            productId: productDetails.id.toInt(),
                            quatity: context.read<ProductCubit>().quantity,
                            size: 2,
                          );
                        },
                        title: 'Add To Cart',
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizeOfProduct extends StatefulWidget {
  const SizeOfProduct({super.key});

  @override
  State<SizeOfProduct> createState() => _SizeOfProductState();
}

class _SizeOfProductState extends State<SizeOfProduct> {
  int count = 1;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Styles.subTitle1Bold.copyWith(color: kDarkGreyColor),
        ),
        Row(
          children: [
            CustomSize(
              title: 'S',
              isSelected: count == 1 ? isSelected : !isSelected,
              onTap: () {
                setState(() {
                  count = 1;
                });
              },
            ),
            const SizedBox(width: 8),
            CustomSize(
              title: 'M',
              isSelected: count == 2 ? isSelected : !isSelected,
              onTap: () {
                setState(() {
                  count = 2;
                });
              },
            ),
            const SizedBox(width: 8),
            CustomSize(
              title: 'L',
              isSelected: count == 3 ? isSelected : !isSelected,
              onTap: () {
                setState(() {
                  count = 3;
                });
              },
            ),
            const SizedBox(width: 8),
            CustomSize(
              title: 'XL',
              isSelected: count == 4 ? isSelected : !isSelected,
              onTap: () {
                setState(() {
                  count = 4;
                });
              },
            ),
            const SizedBox(width: 8),
            CustomSize(
              title: 'XXL',
              isSelected: count == 5 ? isSelected : !isSelected,
              onTap: () {
                setState(() {
                  count = 5;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
