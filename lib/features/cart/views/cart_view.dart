import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';
import 'package:hungry_app/features/cart/widgets/cart_shimmer.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantities;
  @override
  void initState() {
    quantities = [];
    super.initState();
    context.read<CartCubit>().getCart();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMin(int index) {
    setState(() {
      if (quantities[index] > 1) quantities[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const CartItemShimmer();
              },
            );
          }
          if (state is CartLoaded) {
            final cart = state.cart;
            if (quantities.length != cart.length) {
              quantities = cart.map((e) => e.quantity).toList();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 120, top: 15),
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CartItem(
                      onRemove: () {
                        context.read<CartCubit>().deleteItem(item.id);
                      },
                      image: item.image,
                      text: item.name,
                      desc: "Spicy ${item.spicy}",
                      number: quantities[index],
                      onAdd: () {
                        onAdd(index);
                      },
                      onMin: () {
                        onMin(index);
                      },
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
      bottomSheet: Container(
        height: 90,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Total', size: 16),
                CustomText(text: '\$ 18.9', size: 24),
              ],
            ),
            CustomButton(
              text: 'Checkout',
              width: 150,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return CheckoutView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
