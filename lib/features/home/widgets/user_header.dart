import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/profile/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/cubit/profile_states.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return CircularProgressIndicator();
        }
        if(state is ProfileLoaded){
          final image = state.profile.image;
          return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/logo/logo.svg",
                    color: AppColors.primary,
                    height: 35,
                  ),
                  Gap(5),
                  CustomText(
                    text: "Hello, ${state.profile.name}",
                    size: 16,
                    weight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
              Spacer(),
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
        return SizedBox.shrink();
      },
    );
  }
}
