import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';

import '../../../../../core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
  final String name;
  final String email;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
     // contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(120.r),
          child: Image.network(
            imageUrl ,
            width: 60.r,
            height: 60.r,
            fit: BoxFit.fill,
          ),
        ),
      
      
      title: Text(name,
          style: AppStyles.s16.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          )),
      subtitle: Text(email,
          style: AppStyles.s14.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
