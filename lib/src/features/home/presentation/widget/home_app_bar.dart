import 'package:flutter/material.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(AppStrings.recognize,
          style: AppStyles.s16.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          )),
      subtitle: Text(AppStrings.bestRestaurants,
          style: AppStyles.s14.copyWith(
           // color: AppColors.black,
            fontWeight: FontWeight.w600,
          )),

      trailing: const AppImageView(AppAssets.profileImage, isAvatar: true,),
      
    );
  }
}
