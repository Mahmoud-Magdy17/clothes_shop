import 'package:clothes_shop_app/core/widgets/custom_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/favorite_cubit/favorite_cubit.dart';
import 'taps_section.dart';

class MyFavoriteViewBody extends StatefulWidget {
  const MyFavoriteViewBody({super.key});

  @override
  State<MyFavoriteViewBody> createState() => _MyFavoriteViewBodyState();
}

class _MyFavoriteViewBodyState extends State<MyFavoriteViewBody> {
  @override
  void initState() {
    super.initState();
    // استدعاء الفيفوريت عند بداية الشاشة
    context.read<FavoriteCubit>().getAllFeavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const TapsSection(),
          const SizedBox(height: 24.0),
          Expanded(
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is GetFavoriteLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is GetFavoriteError) {
                  return Center(child: Text(state.message));
                } else if (state is GetFavoriteSuccess) {
                  final items = state.items;
                  if (items.isEmpty) {
                    return const Center(child: Text("No favorites yet"));
                  }
                  return GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children:
                        items.map((item) {
                          return CustomCard(
                            title: item.name ?? "no name",
                            subTitle: item.subCategory ?? "sub category",
                            price: item.price?.toString() ?? "no price",
                            image:
                                item.imagePath ??
                                "https://th.bing.com/th/id/OIP.YYAAE9-fWIZ-avQcuTXjeAHaJD?rs=1&pid=ImgDetMain",
                            id: item.productId!,
                            materials: "meterial ",
                          );
                        }).toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
