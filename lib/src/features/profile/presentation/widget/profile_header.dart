import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
              context.push(RouterNames.bottomNavigationBarRoot);
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppStyles.s16.copyWith(
                  color: AppColors.textColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppStrings.edit,
            style: AppStyles.s12.copyWith(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
