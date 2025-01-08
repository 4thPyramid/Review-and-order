import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_image_view.dart';
import '../cubit/profile_cubit.dart';

class PersonalCircleImage extends StatefulWidget {
  const PersonalCircleImage({super.key, this.profileImage});

  final String? profileImage;

  @override
  State<PersonalCircleImage> createState() => _PersonalCircleImageState();
}

class _PersonalCircleImageState extends State<PersonalCircleImage> {
  String? profileImage;

  @override
  void initState() {
    super.initState();
    profileImage = widget.profileImage?.isNotEmpty == true
        ? widget.profileImage!
        : AppAssets.profileImage;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take a photo'),
                onTap: () async {
                  Navigator.pop(
                    context,
                    await picker.pickImage(source: ImageSource.camera),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from gallery'),
                onTap: () async {
                  Navigator.pop(
                    context,
                    await picker.pickImage(source: ImageSource.gallery),
                  );
                },
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      final File? imageFile = File(pickedFile.path);

      setState(() {
        profileImage = imageFile!.path;
      });

      context.read<ProfileCubit>().updateProfilePhoto(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60.r,
          backgroundColor: AppColors.lightGrey,
          child: ClipOval(
            child: AppImageView(
              profileImage ?? '',
              isAvatar: true,
              radius: BorderRadius.circular(60.r),
              height: 120.h,
              width: 120.h,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.primaryColor,
              child: AppImageView(
                AppAssets.editCamera,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
