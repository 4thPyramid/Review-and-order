import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../widgets/add_image_and_btn.dart';
import '../widgets/map_card_details.dart';
import '../widgets/rate_and_time_row.dart';
import '../widgets/title_and_favorite.dart';

class PlaceDetailsComponent extends StatelessWidget {
  const PlaceDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.h, left: 26.w, right: 26.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TitleAndFavoriteButton(
              placeName: "مطعم الراتب الشامي",
            ),
            SizedBox(height: 28.h),
            const RateAndTimeRow(
              openAt: "8:00",
              closeAt: "12:00",
              rate: 4.5,
              reviewsCount: 100,
            ),
            SizedBox(height: 20.h),
            const MapCardDetails(),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(AppStrings.ratings,
                  style: AppStyles.s20.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 20.h),
            const AddImageAndBtn(),
            SizedBox(height: 20.h),
          ])
        ],
      ),
    );
  }
}
