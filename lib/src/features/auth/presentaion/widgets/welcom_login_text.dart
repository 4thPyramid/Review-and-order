import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_styles.dart';

class WelcomAuthText extends StatelessWidget {
  const WelcomAuthText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: AppStyles.s24,
          ),
          SizedBox(height: 10.h),
          Text(
            subTitle,
            style: AppStyles.s16,
          ),
        ],
      ),
    );
  }
}
