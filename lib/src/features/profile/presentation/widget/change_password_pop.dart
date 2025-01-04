import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/widgets/custom_text_form_field.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/main_function.dart';

changePasswordPop(BuildContext context) {
  customAlertDialog(
    marginHPadding: 20.h,
    marginVPadding: 20.h,
    hPadding: 12.w,
    vPadding: 12.h,
    context: context,
    content: Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0.h),
      child: Column(
        children: [
          const CustomTextFormField(
            hintText: AppStrings.password,
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          const CustomTextFormField(
            hintText: AppStrings.newPassword,
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          const CustomTextFormField(
            hintText: AppStrings.confirmPassword,
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            suffixIcon: Icon(Icons.remove_red_eye),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                width: 150.w,
                backgroundColor: AppColors.errorColor,
                text: AppStrings.changePassword,
                textStyle: AppStyles.s12.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                width: 150.w,
                text: AppStrings.cancel,
                backgroundColor: AppColors.white,
                textStyle: AppStyles.s12.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    ),
  );
}
