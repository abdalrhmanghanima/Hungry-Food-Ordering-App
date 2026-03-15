import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  Widget shimmerBox({
    double height = 20,
    double width = double.infinity,
    double radius = 10,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [

            const Gap(20),

            /// profile image
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),

            const Gap(15),

            shimmerBox(height: 40, width: 150, radius: 10),

            const Gap(30),

            shimmerBox(height: 55),

            const Gap(25),

            shimmerBox(height: 55),

            const Gap(25),

            shimmerBox(height: 55),

            const Gap(36),

            shimmerBox(height: 80, radius: 20),

          ],
        ),
      ),
    );
  }
}