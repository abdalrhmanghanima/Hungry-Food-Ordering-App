import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/product/cubit/product_options_cubit.dart';
import 'package:hungry_app/features/product/cubit/product_options_state.dart';
import 'package:hungry_app/features/product/widgets/options_shimmer.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/topping_card.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  final int id;
  final String image;
  final String price;

  const ProductDetailsView({
    super.key,
    required this.id,
    required this.image,
    required this.price,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  double value = 0.5;
  int quantity = 1;

  List<int> selectedToppings = [];
  List<int> selectedSides = [];

  @override
  void initState() {
    super.initState();
    context.read<ProductOptionsCubit>().getProductOptions();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),

      body: BlocBuilder<ProductOptionsCubit, ProductOptionsState>(
        builder: (context, state) {

          if (state is ProductOptionsLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  OptionsShimmer(),
                  SizedBox(height: 40),
                  OptionsShimmer(),
                ],
              ),
            );
          }

          if (state is ProductOptionsSuccess) {

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SpicySlider(
                      image: widget.image,
                      value: value,
                      onChanged: (v) {
                        setState(() {
                          value = v;
                        });
                      },
                    ),

                    const Gap(50),

                    const CustomText(text: 'Toppings', size: 20),

                    const Gap(70),

                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.toppings.length, (index) {

                          final topping = state.toppings[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ToppingCard(
                              imageUrl: topping.image,
                              title: topping.name,
                              isSelected: selectedToppings.contains(topping.id),
                              onAdd: () {

                                setState(() {

                                  if (selectedToppings.contains(topping.id)) {
                                    selectedToppings.remove(topping.id);
                                  } else {
                                    selectedToppings.add(topping.id);
                                  }

                                });

                              },
                            ),
                          );

                        }),
                      ),
                    ),

                    const Gap(20),

                    const CustomText(text: 'Side Options', size: 20),

                    const Gap(70),

                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.sides.length, (index) {

                          final sides = state.sides[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ToppingCard(
                              imageUrl: sides.image,
                              title: sides.name,
                              isSelected: selectedSides.contains(sides.id),
                              onAdd: () {

                                setState(() {

                                  if (selectedSides.contains(sides.id)) {
                                    selectedSides.remove(sides.id);
                                  } else {
                                    selectedSides.add(sides.id);
                                  }

                                });

                              },
                            ),
                          );

                        }),
                      ),
                    ),

                    const Gap(100),

                  ],
                ),
              ),
            );

          }

          return const SizedBox.shrink();
        },
      ),

      bottomSheet: BlocConsumer<CartCubit, CartState>(

        listener: (context, state) {

          if (state is CartAddSuccess) {

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Added to cart successfully"),
              ),
            );

          }

          if (state is CartError) {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );

          }

        },

        builder: (context, state) {

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),

            height: 120,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: 'Total', size: 20),
                      CustomText(text: '\$ ${widget.price}', size: 27),
                    ],
                  ),

                  state is CartLoading
                      ? const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : CustomButton(
                    text: 'Add To Cart',
                    onTap: () {

                      context.read<CartCubit>().addToCart(
                        productId: widget.id,
                        quantity: quantity,
                        spicy: value,
                        toppings: selectedToppings,
                        sides: selectedSides,
                      );

                    },
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}