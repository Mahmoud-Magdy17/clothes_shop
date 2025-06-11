import 'package:clothes_shop_app/core/api/dio_consumer.dart';
import 'package:clothes_shop_app/core/widgets/custom_app_bar.dart';
import 'package:clothes_shop_app/features/cart/data/repos/card_repo/cart_repo_impl.dart';
import 'package:clothes_shop_app/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CartCubit(CartRepoImpl(dioConsumer: DioConsumer(dio: Dio()))),
      child: Scaffold(
        appBar: customAppbar(
          context,
          title: 'My Cart',
          actions: [],
          noBack: true,
        ),
        body: CartViewBody(),
      ),
    );
  }
}
