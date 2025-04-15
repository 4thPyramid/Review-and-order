import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/profile_view_component.dart';
import '../widget/profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ProfileHeader(
              isInBoarding: false,
              title: AppStrings.personalProfile,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 40.h),
          const ProfileComponents(),
        ],
      ),
    );
  }
}
