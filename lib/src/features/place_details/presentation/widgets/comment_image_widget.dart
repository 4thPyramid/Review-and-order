import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/src/features/home/presentation/widget/star_row.dart';

class CommentContentWidget extends StatelessWidget {
  const CommentContentWidget({
    super.key,
    required this.imagePath,
    required this.commentText,
    required this.rate,
  });
  final String imagePath;
  final String commentText;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImageView(
          imagePath,
          width: 150.w,
          height: 137.h,
          radius: BorderRadius.circular(10),
        ),
        SizedBox(width: 20.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130.w,
              child: Text(
                commentText,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            StarRow(rating: rate),
          ],
        )
      ],
    );
  }
}
