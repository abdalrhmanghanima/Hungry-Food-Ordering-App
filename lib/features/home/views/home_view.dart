import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/cubit/home_cubit.dart';
import 'package:hungry_app/features/home/cubit/home_states.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/category_shimmer.dart';
import 'package:hungry_app/features/home/widgets/products_shimmer.dart';
import 'package:hungry_app/features/home/widgets/search_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';
import 'package:hungry_app/features/product/views/product_details_view.dart';
import '../widgets/food_category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [

            /// APP BAR
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 180,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
                child: Column(
                  children: const [
                    UserHeader(),
                    Gap(20),
                    SearchField(),
                  ],
                ),
              ),
            ),

            /// CATEGORY
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: CategoryShimmer(),
                    ),
                  );
                }

                if (state is HomeLoaded) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: FoodCategory(
                        selectedIndex: 0,
                        category: state.categories.data!,
                      ),
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),

            /// PRODUCTS
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {

                if (state is HomeLoading) {
                  return const ProductsShimmer();
                }

                if (state is HomeLoaded) {

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {

                          final product = state.products.data![index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  ProductDetailsView(
                                    id: product.id!,
                                    image: product.image!,
                                    price: product.price!,
                                  ),
                                ),
                              );
                            },
                            child: CardItem(
                              image: product.image ?? '',
                              text: product.name ?? '',
                              desc: product.description ?? '',
                              rate: product.rating ?? '',
                            ),
                          );
                        },
                        childCount: state.products.data!.length,
                      ),
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}