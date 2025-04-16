import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/core/data/cached/cache_helper.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';
import 'package:review_app/src/features/profile/presentation/logic/profile_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.recognize,
                  style: AppStyles.s16.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppStrings.bestRestaurants,
                  style: AppStyles.s14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.when(
                initial: () => const CircularProgressIndicator(),
                loading: () => const CircularProgressIndicator(),
                success: (user) => SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: AppImageView(
                      user.image,
                      isAvatar: true,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                error: (ErrorModel error) {
                  return const AppImageView(
                    AppAssets.networkProfileImage,
                    isAvatar: true,
                    width: 60,
                    height: 60,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
