import 'package:clothes_shop_app/constants.dart';
import 'package:clothes_shop_app/features/home/presentation/manage/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({
    super.key,
    required this.increment,
    required this.decrement,
    required this.quantity,
  });
  final Function() increment;
  final Function() decrement;
  final int quantity;
  @override
  State<CustomCounter> createState() => _ProductCustomQuantityState();
}

class _ProductCustomQuantityState extends State<CustomCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kLightGreyColor,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.remove, size: 16),
            color: widget.quantity == 0 ? kGreyColor : kBlackColor,
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.quantity.toString(),
                style: Styles.bodyText1Regular,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.add, size: 16),
            color: widget.quantity == 10 ? kGreyColor : kBlackColor,
          ),
        ],
      ),
    );
  }
}
