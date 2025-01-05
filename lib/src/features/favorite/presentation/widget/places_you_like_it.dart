

import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class PlacesYouLikeIt extends StatelessWidget {
  const PlacesYouLikeIt({
    super.key, required this.length,
  });
  final int length;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.likeIt,
            style: AppStyles.s14.copyWith(
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text:" $length ${AppStrings.places}",
            style: AppStyles.s14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
