import 'package:flutter/material.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/core/utils/app_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(AppStrings.skip,
          style: AppStyles.s14.copyWith(color: AppColors.primaryColor)),
    );
  }
}
