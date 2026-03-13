import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
  const ProductDetailsView({super.key, required this.id, required this.image, required this.price});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
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
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<ProductOptionsCubit,ProductOptionsState>(
        builder: (context, state) {
          if (state is ProductOptionsLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 50),
                  OptionsShimmer(),
                  SizedBox(height: 40),
                  OptionsShimmer(),
                ],
              ),
            );
          }
          if(state is ProductOptionsSuccess){
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
                    Gap(50),
                    CustomText(text: 'Toppings', size: 20),
                    Gap(70),
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.toppings.length, (index) {
                          final topping = state.toppings[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ToppingCard(
                              imageUrl: topping.image,
                              title: topping.name,
                              onAdd: () {},
                            ),
                          );
                        }),
                      ),
                    ),
                    Gap(20),
                    CustomText(text: 'Side Options', size: 20),
                    Gap(70),
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.sides.length, (index) {
                          final sides = state.sides[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ToppingCard(
                              imageUrl: sides.image,
                              title: sides.name,
                              onAdd: () {},
                            ),
                          );
                        }),
                      ),
                    ),
                    Gap(100),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
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
                  CustomText(text: 'Total', size: 20),
                  CustomText(text: '\$ 18.9', size: 27),
                ],
              ),
              CustomButton(text: 'Add To Cart', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
