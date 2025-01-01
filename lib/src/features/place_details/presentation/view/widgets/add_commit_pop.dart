import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/core/utils/app_strings.dart';
import '../../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/main_function.dart';
import 'add_image_container.dart';

addCommitPop(BuildContext context,
    {required String name, required String imageUrl}) {
  customAlertDialog(
    context: context,
    marginHPadding: 20.h,
    marginVPadding: 20.h,
    hPadding: 12.w,
    vPadding: 12.h,
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -60.h,
          //right: 120,
           left: MediaQuery.sizeOf(context).width / 2- 60.w,
          child: AppImageView(
            imageUrl,
            isAvatar: true,
            width: 80.w,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppStyles.s16.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  AppStrings.youThinkOfTheRestaurant,
                  style: AppStyles.s14.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.feedbackWillHelpImprove,
                  style: AppStyles.s12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.r,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print("Rating is: $rating");
                  },
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.redWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: AppStrings.addCommit,
                      hintStyle: AppStyles.s14.copyWith(
                        color: AppColors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const AddImageContainer(),
                SizedBox(height: 20.h),
                CustomButton(
                  text: AppStrings.sendCommit,
                  onPressed: () {
                   Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
