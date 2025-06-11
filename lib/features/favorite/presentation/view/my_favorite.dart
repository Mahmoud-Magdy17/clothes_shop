import 'package:clothes_shop_app/core/api/dio_consumer.dart';
import 'package:clothes_shop_app/core/widgets/custom_app_bar.dart';
import 'package:clothes_shop_app/features/favorite/data/repos/favorite_repo/favorite_repo_impl.dart';
import 'package:clothes_shop_app/features/favorite/presentation/managers/favorite_cubit/favorite_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/my_favorite_view_body.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FavoriteCubit(
            repoImpl: FavoriteRepoImpl(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child: Scaffold(
        appBar: customAppbar(context, title: 'My Favorite'),
        body: MyFavoriteViewBody(),
      ),
    );
  }
}
