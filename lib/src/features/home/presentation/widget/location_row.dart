import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    super.key,
    required this.location,
  });
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.errorColor,
          size: 14.sp,
        ),
        Text(
          location,
          style: AppStyles.s10.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
