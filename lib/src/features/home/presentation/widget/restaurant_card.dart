import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/core/utils/app_styles.dart';
import 'package:review_app/src/features/home/presentation/widget/location_row.dart';

import 'star_row.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.resurantName,
    required this.resurantLocation,
    required this.resurantRate,
    required this.resurantImage,
    required this.resurantStatus,
  });
  final String resurantName;
  final String resurantLocation;
  final double resurantRate;
  final String resurantImage;
  final String resurantStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              resurantImage,
              width: 85.w,
              height: 105.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 20.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resurantName,
                style: AppStyles.s16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10.h),
              StarRow(rating: resurantRate),
              Row(
                children: [
                  Text(
                    resurantStatus,
                    style: AppStyles.s10.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "يغلق الساعة 5:00 مساءً",
                    style: AppStyles.s12.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              LocationRow(
                location: resurantLocation,
              )
            ],
          ),
        ],
      ),
    );
  }
}
