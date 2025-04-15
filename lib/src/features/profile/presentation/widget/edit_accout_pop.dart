import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/functions/validator.dart';
import 'package:review_app/core/common/widgets/custom_text_form_field.dart';
import 'package:review_app/src/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:review_app/src/features/profile/presentation/logic/profile_cubit.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/main_function.dart';

editAccountPop(BuildContext context) {
  var nameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var phoneTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  customAlertDialog(
    marginHPadding: 20.h,
    marginVPadding: 20.h,
    hPadding: 12.w,
    vPadding: 12.h,
    context: context,
    content: Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0.h),
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameTextController,
              hintText: AppStrings.allName,
              prefixIcon: const Icon(Icons.person_outline),
              validator: Validator.validateName,
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: emailTextController,
              hintText: AppStrings.email,
              prefixIcon: Icon(Icons.email_outlined),
              validator: Validator.validateEmail,
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: phoneTextController,
              hintText: AppStrings.phoneHint,
              prefixIcon: Icon(Icons.phone),
              validator: Validator.validatePhone,
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: AppStrings.save,
              textStyle: AppStyles.s12.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Only proceed if validation passes
                  if (nameTextController.text.isNotEmpty &&
                      emailTextController.text.isNotEmpty &&
                      phoneTextController.text.isNotEmpty) {
                    context.read<ProfileCubit>().updateProfile(
                          name: nameTextController.text,
                          email: emailTextController.text,
                          phone: phoneTextController.text,
                        );
                    context.pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all fields'),
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    ),
  );
}
