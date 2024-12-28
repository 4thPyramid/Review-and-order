import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/routes/app_routers.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/core/utils/app_styles.dart';

class LetsStartView extends StatelessWidget {
  const LetsStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.logo),
          SizedBox(height: 50.h),
          Text(
            AppStrings.letsStart,
            style: AppStyles.s24,
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.introText,
            textAlign: TextAlign.center,
            style: AppStyles.s16.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 50.h),
          CustomButton(
            text: AppStrings.signIn,
            onPressed: () {
              context.go(RouterNames.login);
            },
          ),
          CustomButton(
            backgroundColor: Colors.transparent,
            text: AppStrings.register,
            textStyle: AppStyles.s16.copyWith(
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              context.go(RouterNames.register);
            },
          )
        ],
      ),
    );
  }
}
