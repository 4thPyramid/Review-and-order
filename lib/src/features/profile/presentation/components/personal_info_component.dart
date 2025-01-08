import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../cubit/profile_cubit.dart';
import '../widget/personal_circle_image.dart';
import '../widget/personal_info_list_tile.dart';

class PersonalInfoComponent extends StatelessWidget {
  const PersonalInfoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text("Please wait..."),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (profile) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                PersonalCircleImage(profileImage: profile.image),
                SizedBox(height: 40.h),
                PersonalInfoListTile(
                  title: AppStrings.allName,
                  subtitle: profile.name,
                  icon: Icons.person_outline,
                  iconColor: AppColors.orange,
                ),
                PersonalInfoListTile(
                  title: AppStrings.email,
                  subtitle: profile.email,
                  icon: Icons.email_outlined,
                ),
                PersonalInfoListTile(
                  title: AppStrings.phoneHint,
                  subtitle: profile.phone,
                  icon: Icons.phone,
                ),
              ],
            ),
          ),
          error: (error) => Center(
            child: Text(
              error.message,
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
            ),
          ),
        );
      },
    );
  }
}
