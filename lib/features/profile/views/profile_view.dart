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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: SvgPicture.asset('assets/icon/settings.svg', width: 20),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit,ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return CircularProgressIndicator();
          }

          if (state is ProfileLoaded){
            _name.text = state.profile.name;
            _email.text = state.profile.email;
            _address.text = state.profile.address ?? '';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade300,
                          image: selectedImage != null
                              ? DecorationImage(
                            image: FileImage(selectedImage!),
                            fit: BoxFit.cover,
                          )
                              : DecorationImage(
                            image: NetworkImage(state.profile.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Gap(10),

                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomText(
                          text: 'Change Image',
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Gap(30),
                    CustomUserTextField(controller: _name, label: 'Name'),
                    Gap(25),
                    CustomUserTextField(controller: _email, label: 'Email'),
                    Gap(25),
                    CustomUserTextField(
                      controller: _address,
                      label: 'Delivery Address',
                    ),
                    Gap(36),
                    Divider(),
                    Gap(36),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                      tileColor: Color(0xffF3F4F6),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      leading: Image.asset('assets/icon/profileVisa.png', width: 50),
                      title: CustomText(text: 'Debit card', color: Colors.black),
                      subtitle: CustomText(
                        text: '**** ***** 2342',
                        color: Colors.black,
                      ),
                      trailing: CustomText(text: 'Default', color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade800, blurRadius: 20)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {

                    context.read<ProfileCubit>().updateProfile(
                      name: _name.text,
                      email: _email.text,
                      address: _address.text,
                      image: selectedImage,
                    );

                  },
                  child: Row(
                    children: [
                      CustomText(text: 'Edit Profile', color: Colors.white),
                      Gap(5),
                      Icon(CupertinoIcons.pencil, color: Colors.white),
                    ],
                  ),
                ),
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {

                  if (state is AuthLoggedOut) {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginView()),
                          (route) => false,
                    );

                  }

                },
                child: GestureDetector(
                  onTap: () {

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Log Out"),
                        content: const Text("Are you sure you want to log out?"),
                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),

                          TextButton(
                            onPressed: () {

                              Navigator.pop(context);

                              context.read<AuthCubit>().logout();

                            },
                            child: const Text(
                              "Log Out",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),

                        ],
                      ),
                    );

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        CustomText(text: 'Log Out', color: AppColors.primary),
                        const SizedBox(width: 6),
                         Icon(Icons.logout, color: AppColors.primary),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
