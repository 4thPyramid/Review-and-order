import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';

import '../../../../../core/utils/app_styles.dart';
import 'location_row.dart';
import 'star_row.dart';

class BestRestaurantsCafesCardItem extends StatelessWidget {
  const BestRestaurantsCafesCardItem({
    super.key,
    required this.resurantName,
    required this.resurantLocation,
    required this.resurantRate,
    required this.resurantImage,
    this.onTap,
  });
  final String resurantName;
  final String resurantLocation;
  final double resurantRate;
  final String resurantImage;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          width: 125.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              AppImageView(
                resurantImage,
                width: 125.w,
                height: 147.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resurantName,
                      style: AppStyles.s14.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StarRow(
                      rating: resurantRate,
                    ),
                    LocationRow(
                      location: resurantLocation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
