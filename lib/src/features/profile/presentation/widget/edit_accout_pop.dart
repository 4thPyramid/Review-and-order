import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/widgets/custom_text_form_field.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/main_function.dart';

editAccountPop(BuildContext context) {
  customAlertDialog(
    marginHPadding: 20.h,
    marginVPadding: 20.h,
    hPadding: 12.w,
    vPadding: 12.h,
    context: context,
    content: Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0.h),
      child:  Column(
        children: [
         const CustomTextFormField(
            hintText: AppStrings.allName,
            prefixIcon: Icon(Icons.person_outline),
          ),
          SizedBox(height: 20.h),
           const CustomTextFormField(
            hintText: AppStrings.email,
            prefixIcon: Icon(Icons.email_outlined),
          
          ),
          SizedBox(height: 20.h),
          const CustomTextFormField(
            hintText: AppStrings.phoneHint,
            prefixIcon: Icon(Icons.phone),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: AppStrings.save,
            textStyle: AppStyles.s12.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}
