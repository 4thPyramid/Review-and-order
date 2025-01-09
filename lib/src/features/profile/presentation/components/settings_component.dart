
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../widget/change_password_pop.dart';
import '../widget/custom_list_tile.dart';
import '../widget/delete_account_pop.dart';
import '../widget/personal_info_list_tile.dart';

class SettingsComponent extends StatelessWidget {
  const SettingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.settingsPersonalInfo,
            style: AppStyles.s14.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16.0.h),
           PersonalInfoListTile(
            onTap: () {
               context.go(RouterNames.personalInfoView);
            },
              title: AppStrings.personalInfoData,
              subtitle: "الاسم,ايميل,رقم الهاتف",
              icon: Icons.person_outline,
              iconColor: AppColors.orange),
          //    const PersonalInfoListTile(
          // title: AppStrings.privacy,
          // subtitle: "تحكم فى خصوصيتك",
          // icon: Icons.person_outline,
          // iconColor: AppColors.orange),
          PersonalInfoListTile(
            onTap: ()=>changePasswordPop(context),
              title: AppStrings.changePassword,
              subtitle: AppStrings.hintChangePassword,
              icon: Icons.lock_outline,
              iconColor: AppColors.green),
          SizedBox(height: 20.0.h),
          Text(
            AppStrings.public,
            style: AppStyles.s14.copyWith(fontWeight: FontWeight.w700),
          ),
          const CustomListTile(
          title: AppStrings.language,
          icon: Icons.language,
          iconColor: AppColors.purple,
        ),
           CustomListTile(
           // onPressed: ()=>deleteAccountPop(context),
          title: AppStrings.deleteAccount,
          icon: Icons.delete_outline,
          iconColor: AppColors.errorColor,
        ),
        ],
      ),
    );
  }
}
