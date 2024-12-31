import 'package:flutter/material.dart';
import 'package:review_app/core/common/functions/validator.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentation/widgets/auth_text_form_widget.dart';
import 'package:review_app/src/features/auth/presentation/widgets/custom_sucess_pop.dart';
import 'package:review_app/src/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:review_app/src/features/auth/presentation/widgets/terms_and_conditions.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  //
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextFieldWidget(
            isPassword: false,
            hintText: 'الاسم',
            prefixIcon: Icons.person,
            controller: nameController,
            validator: Validator.validateName,
          ),
          AuthTextFieldWidget(
            isPassword: false,
            hintText: 'البريد الالكتروني',
            prefixIcon: Icons.email,
            controller: emailController,
            validator: Validator.validateEmail,
          ),
          AuthTextFieldWidget(
            isPassword: false,
            hintText: 'رقم الهاتف',
            prefixIcon: Icons.phone,
            controller: phoneController,
            validator: Validator.validatePhone,
          ),
          AuthTextFieldWidget(
            isPassword: true,
            hintText: 'كلمة المرور',
            prefixIcon: Icons.lock,
            controller: passwordController,
            validator: Validator.validatePassword,
          ),
          const TermsAndConditions(),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // context.go(RouterNames.home);
                showSucessPop(context);
              }
            },
            text: AppStrings.register,
          ),
        ],
      ),
    );
  }
}