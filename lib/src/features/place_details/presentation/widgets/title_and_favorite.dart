import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_favorite_place_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TitleAndFavoriteButton extends StatelessWidget {
  const TitleAndFavoriteButton({
    super.key,
    required this.placeName,
    required this.onTap,
  });
  final String placeName;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddFavoritePlaceCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          placeName,
          style: AppStyles.s24.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        BlocBuilder<AddFavoritePlaceCubit, AddFavoritePlaceState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                cubit.status == 1
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color:
                    cubit.status == 1 ? AppColors.errorColor : AppColors.black,
              ),
              onPressed: onTap,
              padding: EdgeInsets.zero,
              color: AppColors.black,
            );
          },
        ),
      ],
    );
  }
}
