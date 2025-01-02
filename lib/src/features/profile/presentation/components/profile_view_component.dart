
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/account_info_card.dart';
import '../widget/custom_list_tile.dart';

class ProfileComponents extends StatelessWidget {
  const ProfileComponents({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AccountInfoCard(
          name: "Ahmed Mohamed",
          phone: "01007698234",
          image: AppAssets.profileImage,
        ),
        SizedBox(height: 40.h),
         CustomListTile(
          onPressed: () {
            context.go(RouterNames.personalInfoView);
          },
          title: AppStrings.personalInfo,
          icon: Icons.person_outline,
          iconColor: AppColors.orange,
        ),
        SizedBox(height: 30.h),
        const CustomListTile(
          title: AppStrings.favorite,
          icon: Icons.favorite_border,
          iconColor: AppColors.purple,
        ),
        const CustomListTile(
          title: AppStrings.notification,
          icon: Icons.notifications_none,
          iconColor: AppColors.primaryColor,
        ),
        SizedBox(height: 30.h),
         CustomListTile(
          onPressed: () {
            context.go(RouterNames.settingView);
          },
          title: AppStrings.settings,
          icon: Icons.settings_outlined,
        ),
        SizedBox(height: 30.h),
        const CustomListTile(
          title: AppStrings.signout,
          icon: Icons.logout,
          iconColor: AppColors.errorColor,
        ),
      ],
    );
  }
}