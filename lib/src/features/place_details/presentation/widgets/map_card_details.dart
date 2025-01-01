import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_image_view.dart';
import '../../../../../core/utils/app_styles.dart';

class MapCardDetails extends StatelessWidget {
  const MapCardDetails({
    super.key,
    required this.restaurantAddress,
    required this.arrivalTime,
  });
  final String restaurantAddress;
  final String arrivalTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            AppImageView(
              AppAssets.mapImage,
              width: 140.w,
              height: 146.h,
              radius: BorderRadius.circular(19.r),
            ),
            SizedBox(width: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text(
                    restaurantAddress,
                    style: AppStyles.s16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 12.r,
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$arrivalTime دقائق سير على الاقدام",
                      style: AppStyles.s10.copyWith(
                        color: AppColors.lightBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
