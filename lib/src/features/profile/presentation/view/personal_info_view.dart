import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/core/utils/app_styles.dart';
import 'package:review_app/src/features/profile/presentation/widget/personal_circle_image.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/personal_info_component.dart';
import '../widget/personal_info_list_tile.dart';
import '../widget/profile_header.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: ProfileHeader(
          title: AppStrings.personalProfile,
          onPressed: () {
            
          },
        ),
      ),
      body: const PersonalInfoComponent(),
    );
  }
}
