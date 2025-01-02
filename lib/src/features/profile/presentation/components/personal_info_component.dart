import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/personal_circle_image.dart';
import '../widget/personal_info_list_tile.dart';

class PersonalInfoComponent extends StatelessWidget {
  const PersonalInfoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40.h),
          const PersonalCircleImage(),
          SizedBox(height: 40.h),
          const PersonalInfoListTile(
              title: AppStrings.allName,
              subtitle: "Ahmed Mohamed",
              icon: Icons.person_outline,
              iconColor: AppColors.orange),
          const PersonalInfoListTile(
            title: AppStrings.email,
            subtitle: "AhmedSalman@gmail.com",
            icon: Icons.email_outlined,
          ),
          const PersonalInfoListTile(
            title: AppStrings.phoneHint,
            subtitle: "01007698234",
            icon: Icons.phone,
          )
        ],
      ),
    );
  }
}
