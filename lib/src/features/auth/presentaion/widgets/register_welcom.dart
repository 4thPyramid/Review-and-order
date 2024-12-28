import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/core/utils/app_styles.dart';

class RegisterWelcom extends StatelessWidget {
  const RegisterWelcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        const Text(
          AppStrings.register,
          style: AppStyles.s18,
        ),
        SizedBox(
          width: 50.w,
        ),
      ],
    );
  }
}
