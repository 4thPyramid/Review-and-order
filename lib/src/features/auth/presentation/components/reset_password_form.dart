import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/functions/validator.dart';
import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/utils/app_strings.dart';
import '../logic/forget_password/forget_password_cubit.dart';
import '../logic/forget_password/forget_password_state.dart';
import '../widgets/auth_text_form_widget.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordForm({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<ForgetPasswordCubit>().resetPassword(
            widget.email,
            widget.code,
            passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          resetPasswordLoaded: (message) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,
              ),
            );
            context.go( RouterNames.login);
          },
          resetPasswordError: (error) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final bool isLoading = state.maybeWhen(
          resetPasswordLoading: () => true,
          orElse: () => false,
        );

        return Form(
          key: formKey,
          child: Column(
            children: [
              AuthTextFieldWidget(
                isPassword: true,
                hintText: 'كلمة المرور',
                prefixIcon: Icons.lock,
                controller: passwordController,
                validator: Validator.validatePassword,
                //enabled: !isLoading,
              ),
              AuthTextFieldWidget(
                isPassword: true,
                hintText: 'تأكيد كلمة المرور',
                prefixIcon: Icons.lock,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return Validator.validatePassword(value);
                },
              //  enabled: !isLoading,
              ),
              SizedBox(height: 50.h),
              CustomButton(
                width: 326.w,
                height: 56.h,
                text: isLoading ? "جاري التحميل..." : AppStrings.resetPassword,
                onPressed: _resetPassword ,
              ),
            ],
          ),
        );
      },
    );
  }
}