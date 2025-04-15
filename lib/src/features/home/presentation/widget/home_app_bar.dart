import 'package:flutter/material.dart';
import 'package:review_app/core/data/cached/cache_helper.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    getImage() async {
      final cacheHelper = CacheHelper();
      String? image = await cacheHelper.getDataString(key: 'image');
      return image;
    }

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
          FutureBuilder(
            future: getImage(),
            builder: (context, snapshot) {
              return Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AppImageView(
                    snapshot.data ?? AppAssets.profileImage,
                    isAvatar: true,
                    width: 60,
                    height: 60,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
