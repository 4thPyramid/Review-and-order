import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_styles.dart';
import 'package:review_app/src/features/onbording/presentation/widgets/get_buttons.dart';

class OnBoardinBottomSection extends StatelessWidget {
  const OnBoardinBottomSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.currentIndex,
    required this.controller,
  });
  final String title;
  final String subtitle;
  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.black,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.4),
              blurRadius: 10,
              spreadRadius: 10,
              offset: const Offset(0, -15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.s24.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              subtitle,
              style: AppStyles.s16.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            GetButtons(
              currentIndex: currentIndex,
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
