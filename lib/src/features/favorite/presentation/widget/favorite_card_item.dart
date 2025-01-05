import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/core/utils/app_styles.dart';

import '../../../../../core/routes/router_names.dart';
import '../../data/model/favorite_response.dart';

class FavoriteCardItem extends StatelessWidget {
  const FavoriteCardItem({
    super.key,
    required this.favorite,
  });
  final FavoriteData favorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
                       onTap: () {
                    context.pushReplacement(
                      RouterNames.placeDetailsView,
                      extra: {'placeId': favorite.id},
                    );
                 //   print("**************${places[index].id}****************");
                  },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
        margin: EdgeInsets.symmetric(
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withAlpha(40),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.r),
              child: AppImageView(
                favorite.coverImage,
                width: 130.w,
                height: 120.h,
                radius: BorderRadius.circular(12.h),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favorite.name,
                    style: AppStyles.s14.copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.black),
                    textDirection: TextDirection.rtl,
                  ),
                   SizedBox(height: 8.h),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(
                        favorite.rating.toStringAsFixed(1),
                        style:
                            AppStyles.s12.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' (${favorite.reviewsCount} تعليق)',
                        style:
                            AppStyles.s12.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                   SizedBox(height: 8.h),
                  Row(
                    children: [
                       Icon(Icons.access_time, size: 20.r),
                      Text(
                        ' يفتح ${favorite.openAt}',
                        style: AppStyles.s10.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w, bottom: 10.h),
              child:  Icon(
                Icons.favorite,
                color: Colors.amber,
                size: 28.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
