import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/functions/validator.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentation/widgets/auth_text_form_widget.dart';

class ForgetPasswordForm extends StatelessWidget {
  ForgetPasswordForm({
    super.key,
    required TabController tabController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
  })  : _tabController = tabController,
        _phoneController = phoneController,
        _emailController = emailController;

  final TabController _tabController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: TabBarView(
              controller: _tabController,
              children: [
                AuthTextFieldWidget(
                  prefixIcon: Icons.phone,
                  controller: _phoneController,
                  validator: Validator.validatePhoneNumber,
                  hintText: 'رقم الهاتف',
                  isPassword: false,
                ),
                AuthTextFieldWidget(
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  hintText: 'البريد الإلكتروني',
                  isPassword: false,
                ),
              ],
            ),
          ),
          CustomButton(
              width: 326.w,
              height: 56.h,
              text: AppStrings.resetPassword,
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              }),
          SizedBox(height: 200.h),
        ],
      ),
    );
  }
}
