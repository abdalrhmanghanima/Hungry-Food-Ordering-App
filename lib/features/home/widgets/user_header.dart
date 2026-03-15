import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hungry_app/features/profile/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/cubit/profile_states.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  Widget shimmerBox({
    double height = 20,
    double width = 100,
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
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {

        /// LOADING SHIMMER
        if (state is ProfileLoading) {
          return Row(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  shimmerBox(height: 30, width: 120),

                  const Gap(8),

                  shimmerBox(height: 16, width: 150),
                ],
              ),

              const Spacer(),

              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: const CircleAvatar(
                  radius: 31,
                  backgroundColor: Colors.white,
                ),
              ),

            ],
          );
        }

        /// DATA LOADED
        if (state is ProfileLoaded) {

          final image = state.profile.image;

          return Row(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SvgPicture.asset(
                    "assets/logo/logo.svg",
                    color: AppColors.primary,
                    height: 35,
                  ),

                  const Gap(5),

                  CustomText(
                    text: "Hello, ${state.profile.name}",
                    size: 16,
                    weight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),

              const Spacer(),

              CircleAvatar(
                radius: 31,
                backgroundColor: AppColors.primary,
                backgroundImage:
                (image != null && image.isNotEmpty)
                    ? NetworkImage(image)
                    : null,
                child: (image == null || image.isEmpty)
                    ? const Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                )
                    : null,
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
