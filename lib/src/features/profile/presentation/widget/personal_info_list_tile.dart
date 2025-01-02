
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class PersonalInfoListTile extends StatelessWidget {
  const PersonalInfoListTile(
      {super.key,
      required this.title,
      this.icon,
      required this.subtitle,
      this.iconColor});
  final String title;
  final IconData? icon;
  final String subtitle;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        leading: Icon(
          icon,
          color: iconColor ?? AppColors.blue,
          size: 24.r,
        ),
        title: Text(
          title,
          style: AppStyles.s14.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blueBlack,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppStyles.s14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
