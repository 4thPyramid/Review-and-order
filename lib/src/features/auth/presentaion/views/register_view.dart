import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/auth/presentaion/componants/register_form.dart';
import 'package:review_app/src/features/auth/presentaion/widgets/have_an_account_widget.dart';
import 'package:review_app/src/features/auth/presentaion/widgets/register_welcom.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150.h),
          const RegisterWelcom(),
          RegisterForm(),
          HaveAnAccountWidget(
            onTap: () {
              context.go(RouterNames.login);
            },
            title1: AppStrings.haveAnAccoun,
            title2: AppStrings.signIn,
          ),
        ],
      ),
    );
  }
}
