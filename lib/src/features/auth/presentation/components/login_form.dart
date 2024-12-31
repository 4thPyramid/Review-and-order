import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/functions/validator.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/common/widgets/custom_text_field_button.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentation/widgets/auth_text_form_widget.dart';
import 'package:review_app/src/features/auth/presentation/widgets/custom_sucess_pop.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextFieldWidget(
            titelOfField: 'البريد الالكتروني',
            isPassword: false,
            hintText: 'البريد الالكتروني',
            prefixIcon: Icons.email,
            controller: emailController,
            validator: Validator.validateEmail,
          ),
          const SizedBox(height: 10),
          AuthTextFieldWidget(
            titelOfField: 'كلمة المرور',
            isPassword: true,
            hintText: 'كلمة المرور',
            prefixIcon: Icons.lock,
            controller: passwordController,
            validator: Validator.validatePassword,
          ),
          const SizedBox(height: 10),
          CustomTextButton(
            title: AppStrings.forgetPassword,
            onTap: () {
              context.go(RouterNames.forgetPassword);
            },
          ),
          SizedBox(height: 60.h),
          CustomButton(
            width: 342.w,
            height: 50.h,
            text: AppStrings.signIn,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // context.go(RouterNames.home);
                showSucessPop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}