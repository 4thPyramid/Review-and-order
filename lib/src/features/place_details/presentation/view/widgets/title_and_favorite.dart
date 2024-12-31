
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class TitleAndFavoriteButton extends StatelessWidget {
  const TitleAndFavoriteButton({
    super.key,
    required this.placeName,
  });
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          placeName,
          style: AppStyles.s24.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
          padding: EdgeInsets.zero,
          color: AppColors.black,
        ),
      ],
    );
  }
}
