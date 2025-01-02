
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.icon,
      this.iconColor,
      this.onPressed});
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        leading: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.lightGrey,
            child: Icon(
              icon,
              color: iconColor ?? AppColors.black,
              size: 24.r,
            )),
        title: Text(
          title,
          style: AppStyles.s16.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios,size: 16,),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
