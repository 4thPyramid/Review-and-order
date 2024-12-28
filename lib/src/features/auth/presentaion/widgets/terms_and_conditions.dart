import 'package:flutter/material.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_styles.dart';
import 'package:review_app/src/features/auth/presentaion/widgets/custom_check_box.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const CustomCheckBox(),
        RichText(
          text: TextSpan(
            text: "وافق علي",
            style: AppStyles.s14,
            children: [
              TextSpan(
                text: '  شروط الاستخدام ',
                style: AppStyles.s14.copyWith(color: AppColors.primaryColor),
              ),
              TextSpan(
                text: 'وسياية الخصوصية ',
                style: AppStyles.s14,
              ),
              TextSpan(
                text: 'الخاصه بك',
                style: AppStyles.s14.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
