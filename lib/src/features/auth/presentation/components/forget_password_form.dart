import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/functions/validator.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentation/widgets/auth_text_form_widget.dart';

import '../../../../../core/routes/router_names.dart';
import '../logic/forget_password/forget_password_cubit.dart';
import '../logic/forget_password/forget_password_state.dart';

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
    late String inputValue;
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,
              ),
            );
            context.push(RouterNames.verifyCodeView, extra: inputValue);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
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
                  text: state.maybeWhen(
                    loading: () => 'جاري التحميل...',
                    orElse: () => AppStrings.resetPassword,
                  ),
                  onPressed: state.maybeWhen(
                    orElse: () => () {
                      if (formKey.currentState!.validate()) {
                        final activeIndex = _tabController.index;

                        if (activeIndex == 0) {
                          inputValue = _phoneController.text;
                        } else {
                          inputValue = _emailController.text;
                        }

                        log(inputValue);

                        context
                            .read<ForgetPasswordCubit>()
                            .forgetPassword(inputValue);
                        _phoneController.clear();
                        _emailController.clear();
                      }
                    },
                  ),
                ),
                SizedBox(height: 200.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
