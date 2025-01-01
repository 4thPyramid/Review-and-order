import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/src/features/home/presentation/widget/star_row.dart';

import '../../../../../core/utils/app_styles.dart';

class RateAndTimeRow extends StatelessWidget {
  const RateAndTimeRow({
    super.key,
    required this.openAt,
    required this.closeAt,
    required this.rate,
    required this.reviewsCount,
  });
  final String openAt;
  final String closeAt;
  final double rate;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 12.r, color: AppColors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'يفتح الساعة ${openAt} صباحا',
                    style: AppStyles.s10.copyWith(color: AppColors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 12.r, color: AppColors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'يغلق الساعة ${closeAt} مساء',
                    style: AppStyles.s10.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey[300],
            // margin: EdgeInsets.symmetric(horizontal: 16.h),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarRow(
                itemSize: 24.r,
                textStyle: AppStyles.s16, rating: rate,
                // rating: rate,
              ),
              const SizedBox(height: 4),
              Text('${reviewsCount} Reviews',
                  style: AppStyles.s12.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
