import 'package:flutter/material.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppStyles.s12.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}