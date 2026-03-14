import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartItemShimmer extends StatelessWidget {
  const CartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(height: 70, width: 70, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 12, width: 120, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 10, width: 80, color: Colors.white),
                ],
              ),
            ),
            Container(height: 30, width: 60, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
