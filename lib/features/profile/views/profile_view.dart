import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/cubit/auth_state.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/features/profile/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/cubit/profile_states.dart';
import 'package:hungry_app/features/profile/widgets/profile_shimmer.dart';

import '../../../shared/custom_text.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  File? selectedImage;

  Future<void> pickImage() async {

    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {

      setState(() {
        selectedImage = File(pickedFile.path);
      });

    }
  }

  void updateProfile(){

    context.read<ProfileCubit>().updateProfile(
      name: _name.text,
      email: _email.text,
      address: _address.text,
      image: selectedImage,
    );

  }

  void logOut(){

    context.read<AuthCubit>().logout();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,

        automaticallyImplyLeading: false,

        leading: GestureDetector(

          onTap: () {

            showDialog(
              context: context,
              builder: (context) => AlertDialog(

                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to log out?"),

                actions: [

                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),

                  TextButton(
                    onPressed: (){

                      Navigator.pop(context);
                      logOut();

                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.red),
                    ),
                  )

                ],
              ),
            );

          },

          child: Icon(Icons.logout,color: AppColors.primary),

        ),

        actions: [

          GestureDetector(

            onTap: (){

              showDialog(
                context: context,
                builder: (context) => AlertDialog(

                  title: const Text("Confirm Edit"),
                  content: const Text("Do You Want to Update Profile?"),

                  actions: [

                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),

                    TextButton(
                      onPressed: (){

                        Navigator.pop(context);
                        updateProfile();

                      },
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  ],
                ),
              );

            },

            child: Icon(
              CupertinoIcons.pencil,
              color: Colors.black,
              size: 27,
            ),

          ),

          Gap(8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset(
              'assets/icon/settings.svg',
              width: 22,
              color: Colors.black,
            ),
          ),

        ],

      ),

      body: BlocListener<AuthCubit, AuthState>(

        listener: (context, state) {

          if (state is AuthLoggedOut) {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginView()),
                  (route) => false,
            );

          }

        },

        child: BlocBuilder<ProfileCubit, ProfileState>(

          builder: (context, state) {

            if (state is ProfileLoading) {

              return ProfileShimmer();

            }

            if (state is ProfileLoaded) {

              if (_name.text.isEmpty) {
                _name.text = state.profile.name;
                _email.text = state.profile.email;
                _address.text = state.profile.address ?? '';
              }

              return Padding(

                padding: const EdgeInsets.symmetric(horizontal: 15),

                child: SingleChildScrollView(

                  child: Column(

                    children: [

                      const Gap(10),

                      /// profile image
                      Center(
                        child: Container(
                          height: 110,
                          width: 110,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: AppColors.primary,
                            ),
                          ),

                          clipBehavior: Clip.antiAlias,

                          child: selectedImage != null
                              ? Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            state.profile.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const Gap(10),

                      GestureDetector(

                        onTap: pickImage,

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),

                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: const CustomText(
                            text: 'Change Image',
                            color: Colors.white,
                          ),
                        ),

                      ),

                      const Gap(30),

                      CustomUserTextField(
                        controller: _name,
                        label: 'Name',
                      ),

                      const Gap(25),

                      CustomUserTextField(
                        controller: _email,
                        label: 'Email',
                      ),

                      const Gap(25),

                      CustomUserTextField(
                        controller: _address,
                        label: 'Delivery Address',
                      ),

                      const Gap(36),

                      const Divider(),

                      const Gap(20),

                      ListTile(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        tileColor: const Color(0xffF3F4F6),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),

                        leading: Image.asset(
                          'assets/icon/profileVisa.png',
                          width: 50,
                        ),

                        title: const CustomText(
                          text: 'Debit card',
                          color: Colors.black,
                        ),

                        subtitle: const CustomText(
                          text: '**** **** ****',
                          color: Colors.black,
                        ),

                        trailing: const CustomText(
                          text: 'Default',
                          color: Colors.black,
                        ),

                      ),

                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
