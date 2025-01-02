
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_image_view.dart';

class PersonalCircleImage extends StatelessWidget {
  const PersonalCircleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppImageView(
          AppAssets.profileImage,
          isAvatar: true,
          width: 100,
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.primaryColor,
                child: AppImageView(
                  AppAssets.editCamera,
                  height: 20.r,
                )))
      ],
    );
  }
}
