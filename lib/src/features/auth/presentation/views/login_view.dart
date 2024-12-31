import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentation/components/login_form.dart';
import 'package:review_app/src/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:review_app/src/features/auth/presentation/widgets/welcom_login_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 100.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                const WelcomAuthText(
                  title: AppStrings.signIn,
                  subTitle: AppStrings.welcomeInLogin,
                ),
                LoginForm(),
                HaveAnAccountWidget(
                  onTap: () {
                    context.go(RouterNames.register);
                  },
                  title1: AppStrings.donotHaveAnAccount,
                  title2: AppStrings.register,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
